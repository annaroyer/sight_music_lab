class SongSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :key, :tse, :each_beat, :notes

  def notes(beats=0)
    object.notes.map do |note|
      beats += note.num_beats
      if beats % object.beats_per_measure == 1
        "#{note.name} | "
      else
        note.name
      end
    end
  end

  def key
    object.key
  end

  def each_beat
    '1/' + object.tse.split('/').last
  end

  def tse
    object.tse
  end
end
