class AdventureUser < Retriever::Model
  include Retriever::Model::UserMixin

  register(:adventure_user, name: Plugin[:"mikutter-adventure"]._("アドベンチャー"))

  field.string(:idname, required: true)
  field.string(:name, required: true)
  field.string(:uri, required: true)
  field.string(:profile_image_url, required: true)
end

class AdventureMessage < Retriever::Model
  include Retriever::Model::MessageMixin

  register(:adventure_message, name: Plugin[:"mikutter-adventure"]._("アドベンチャー"))

  field.string(:description, required: false)
  field.time(:created, required: false)
  field.string(:uri, required: true)
  field.has(:user, AdventureUser, required: true)
  field.has(:confirm, Hash, required: false)
  field.has(:confirm_callback, Proc, required: false)
end


