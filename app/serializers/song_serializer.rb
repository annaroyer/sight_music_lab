class SongSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :key, :tse, :bpm, :notes

  def notes
    beats = 0
    object.notes.map do |note|
      beats += (1.0 / note.beat_length)
      if beats == 1
        beats = 0
        "#{note.name} | "
      else
        note.name
      end
    end
  end

  def key
    object.key
  end

  def bpm
    object.bpm
  end

  def tse
    object.tse
  end
end
