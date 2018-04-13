class AttemptSerializer < ActiveModel::Serializer
  attributes :song

  def song
    SongSerializer.new(object.song).attributes
  end
end
