Rails.application.config.blacklist = []
Rails.application.config.blacklist = YAML.load_file( Rails.root.join('config', 'blacklist.yaml') )
