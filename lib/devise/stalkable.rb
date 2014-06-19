require 'devise'
require 'devise/stalkable/version'
require 'devise/hooks/stalkable'
require 'devise/models/stalkable'

Devise.add_module :stalkable, :model => 'devise/models/stalkable'

