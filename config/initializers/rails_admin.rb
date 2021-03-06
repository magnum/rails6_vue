RailsAdmin.config do |config|
  config.main_app_name = [Rails.application.class.parent_name]
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.navigation_static_links = {
    'API docs' => '/api-docs'
  }



  ## == Globalize ==
  translated_models = []
  config.included_models = [
    'User',
  ].concat(translated_models.map{|model| [model, "#{model}::Translation"]}.flatten)

  ## == Globalize Translated Fields ==
  translated_models.each do |model|

    config.model model do
      configure :translations, :globalize_tabs
    end

    config.model "#{model}::Translation" do
      visible false
      configure :locale, :hidden do
        help ''
      end
      include_fields :locale, *Object.const_get(model).translated_attribute_names
    end
  end

end
