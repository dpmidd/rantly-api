class RantSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at
  has_one :user, except: [:rants]
end
