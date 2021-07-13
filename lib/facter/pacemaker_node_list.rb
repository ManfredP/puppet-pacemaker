require 'facter'

Facter.add('pacemaker_node_list') do
  setcode do
    nodes = Facter::Core::Execution.exec 'crm_node -l 2>/dev/null'
    unless nodes.nil?
      nodes.split("\n")
    end
  end
end
