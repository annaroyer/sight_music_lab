class SongSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :key, :tse, :each_beat, :notes

  def notes(beats=0)
    object.notes.map do |note|
      name = "#{note.letter}#{note.num_beats}"
      if note.off_time % object.measure_duration <= 0.25
        name + ' | '
      else
        name
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
