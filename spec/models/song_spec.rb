require 'rails_helper'

describe Song do
  context 'attributes' do
    it 'is initialized with two hashes and has many attributes' do
      song = Song.new(song_attributes)

      expect(song.key)
    end
  end
end

def melody_attributes
  {key: "g  min", key_index: 19, tuning_frequency: 441.8300476074219, notes: [{midi_pitch: 62.19002914428711, onset_time: 0.3377097505668934, duration: 0.21727891156462584, volume: 0.015046981163322926}, {midi_pitch: 64.18123626708984, onset_time: 0.7720861678004535, duration: 0.30587301587301585, volume: 0.01479336153715849}, {midi_pitch: 64.95268249511719, onset_time: 1.0808616780045353, duration: 0.04873015873015873, volume: 0.009988290257751942}, {midi_pitch: 65.93978881835938, onset_time: 1.1324263038548752, duration: 0.39650793650793653, volume: 0.021184101700782776}, {midi_pitch: 65.87293243408203, onset_time: 1.531859410430839, duration: 0.22419501133786848, volume: 0.011436096392571926}, {midi_pitch: 64.83770751953125, onset_time: 1.758888888888889, duration: 0.18487528344671203, volume: 0.011055037379264832}, {midi_pitch: 66.50758361816406, onset_time: 1.9466666666666668, duration: 0.20800453514739228, volume: 0.00786474347114563}, {midi_pitch: 66.69569396972656, onset_time: 2.2631746031746034, duration: 0.12687074829931974, volume: 0.012497849762439728}, {midi_pitch: 65.40707397460938, onset_time: 2.392630385487528, duration: 0.5075736961451247, volume: 0.040521491318941116}, {midi_pitch: 63.1633186340332, onset_time: 3.1786167800453513, duration: 0.5116326530612245, volume: 0.059914857149124146}, {midi_pitch: 62.056304931640625, onset_time: 3.693469387755102, duration: 0.13768707482993198, volume: 0.16361407935619354}, {midi_pitch: 67.47760772705078, onset_time: 3.9415873015873015, duration: 0.2660997732426304, volume: 0.06732146441936493}, {midi_pitch: 66.26436614990234, onset_time: 4.21015873015873, duration: 0.10514739229024943, volume: 0.022528091445565224}, {midi_pitch: 68.2115249633789, onset_time: 4.3179818594104304, duration: 0.09938775510204081, volume: 0.017640696838498116}, {midi_pitch: 68.99482727050781, onset_time: 4.419727891156462, duration: 0.19376417233560092, volume: 0.08066657185554504}, {midi_pitch: 68.05511474609375, onset_time: 4.615850340136054, duration: 0.3922675736961451, volume: 0.06708405166864395}, {midi_pitch: 71.81482696533203, onset_time: 5.31031746031746, duration: 0.24188208616780046, volume: 0.07395152747631073}, {midi_pitch: 70.67323303222656, onset_time: 5.55421768707483, duration: 0.1703628117913832, volume: 0.015168110840022564}, {midi_pitch: 70.47502136230469, onset_time: 5.779297052154195, duration: 0.13684807256235829, volume: 0.3420877754688263}, {midi_pitch: 58.09034729003906, onset_time: 5.920408163265306, duration: 0.2090249433106576, volume: 0.030902158468961716}, {midi_pitch: 70.78362274169922, onset_time: 6.133718820861678, duration: 0.1027891156462585, volume: 0.02761932462453842}, {midi_pitch: 67.0979995727539, onset_time: 6.23859410430839, duration: 0.6615419501133787, volume: 0.01590573973953724}]}
end