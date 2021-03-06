include_recipe "pivotal_workstation::bash_it"
include_recipe "meta::create_custom_bash_it_themes"
include_recipe "pivotal_workstation::workspace_directory"
include_recipe "pivotal_workstation::homebrew"
include_recipe "sprout-osx-settings::global_environment_variables"

# git
include_recipe "pivotal_workstation::git_config_global_defaults"
include_recipe "pivotal_workstation::git_scripts"
include_recipe "pivotal_workstation::github_for_mac"
include_recipe "pivotal_workstation::gitx"

include_recipe "pivotal_workstation::iterm2"
include_recipe "pivotal_workstation::keycastr"

# textmate
include_recipe "pivotal_workstation::textmate"
include_recipe "pivotal_workstation::textmate_bundles"
include_recipe "pivotal_workstation::textmate_preferences"

# vim / macvim
include_recipe "pivotal_workstation::vim"
include_recipe "pivotal_workstation::vim_config"
include_recipe "pivotal_workstation::unix_essentials"

include_recipe "sprout-osx-apps::gpg"
include_recipe "sprout-osx-apps::gpgtools"

include_recipe "sprout-osx-apps::vagrant"
include_recipe "sprout-osx-apps::virtualbox"

include_recipe "sprout-osx-apps::node_js"
include_recipe "meta::jsontool"
include_recipe "meta::smartdc"
include_recipe "pivotal_workstation::rbenv"

# data-science
include_recipe "meta::julia_studio"
include_recipe "meta::r"
include_recipe "meta::rstudio"
include_recipe "meta::python"
include_recipe "meta::lua"

# databases
include_recipe "pivotal_workstation::redis"
include_recipe "pivotal_workstation::mysql"
include_recipe "meta::create_mysql_users"
include_recipe "pivotal_workstation::postgres"


