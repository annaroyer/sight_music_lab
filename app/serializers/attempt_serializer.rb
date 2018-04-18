class AttemptSerializer < ActiveModel::Serializer
  attributes :song, :pitch_score, :rhythm_score

  def song
    SongSerializer.new(object.song).attributes
  end
end
