import hcl2
from graphviz import Digraph
import os

def parse_terraform_files(directory):
    resources = []
    for filename in os.listdir(directory):
        if filename.endswith(".tf"):
            with open(os.path.join(directory, filename), 'r') as file:
                terraform_config = hcl2.load(file)
                if 'resource' in terraform_config:
                    resources.extend(terraform_config['resource'])
    return resources

def create_graph(resources):
    dot = Digraph(comment='Terraform Architecture')

    for resource in resources:
        for resource_type, resource_definitions in resource.items():
            for resource_name, resource_attributes in resource_definitions.items():
                node_label = f"{resource_type}\n{resource_name}"
                dot.node(resource_name, label=node_label)

                # Example: link subnet to VPC
                if resource_type == 'google_compute_subnetwork' and 'network' in resource_attributes:
                    dot.edge(resource_attributes['network'], resource_name)

                # Example: link instance to subnet
                if resource_type == 'google_compute_instance' and 'network_interface' in resource_attributes:
                    for interface in resource_attributes['network_interface']:
                        if 'subnetwork' in interface:
                            dot.edge(interface['subnetwork'], resource_name)
    
    return dot

def main(terraform_directory):
    resources = parse_terraform_files(terraform_directory)
    diagram = create_graph(resources)
    diagram.render('terraform_architecture', format='png', cleanup=True)
    print("Architecture diagram generated as 'terraform_architecture.png'")

if __name__ == "__main__":
    terraform_directory = '.'  # Specify your Terraform directory
    main(terraform_directory)