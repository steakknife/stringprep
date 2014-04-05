require 'stringprep'

# thank you Python for your test cases ;)
# adapted from test_stringprep.py

describe Stringprep do
  describe '.in_a1' do
    it { expect(Stringprep::in_a1("\u0221")).to be_true }
    it { expect(Stringprep::in_a1("\u0222")).to be_false }
  end

  describe '.in_b1' do
    it { expect(Stringprep::in_b1("\u00ad")).to be_true }
    it { expect(Stringprep::in_b1("\u00ae")).to be_false }
  end

  describe '.map_b3' do
    it { expect(Stringprep::map_b2("\u0041")).to eq("\u0061") }
    it { expect(Stringprep::map_b2("\u0061")).to eq("\u0061") }
  end

  describe '.in_c11' do
    it { expect(Stringprep::in_c11("\u0020")).to be_true }
    it { expect(Stringprep::in_c11("\u0021")).to be_false }
  end

  describe '.in_c12' do
    it { expect(Stringprep::in_c12("\u00a0")).to be_true }
    it { expect(Stringprep::in_c12("\u00a1")).to be_false }
  end

  describe '.in_c11_c12' do
    it { expect(Stringprep::in_c11_c12("\u00a0")).to be_true }
    it { expect(Stringprep::in_c11_c12("\u00a1")).to be_false }
  end

  describe '.in_c21' do
    it { expect(Stringprep::in_c21("\u001f")).to be_true }
    it { expect(Stringprep::in_c21("\u0020")).to be_false }
  end

  describe '.in_c22' do
    it { expect(Stringprep::in_c22("\u009f")).to be_true }
    it { expect(Stringprep::in_c22("\u00a0")).to be_false }
  end

  describe '.in_c21_c22' do
    it { expect(Stringprep::in_c21_c22("\u009f")).to be_true }
    it { expect(Stringprep::in_c21_c22("\u00a0")).to be_false }
  end

  describe '.in_c3' do
    it { expect(Stringprep::in_c3("\ue000")).to be_true }
    it { expect(Stringprep::in_c3("\uf900")).to be_false }
  end

  describe '.in_c4' do
    it { expect(Stringprep::in_c4("\uffff")).to be_true }
    it { expect(Stringprep::in_c4("\u0000")).to be_false }
  end

  describe '.in_c5' do
    it { expect(Stringprep::in_c5("\ud800")).to be_true }
    it { expect(Stringprep::in_c5("\ud7ff")).to be_false }
  end

  describe '.in_c6' do
    it { expect(Stringprep::in_c6("\ufff9")).to be_true }
    it { expect(Stringprep::in_c6("\ufffe")).to be_false }
  end

  describe '.in_c7' do
    it { expect(Stringprep::in_c7("\u2ff0")).to be_true }
    it { expect(Stringprep::in_c7("\u2ffc")).to be_false }
  end

  describe '.in_c8' do
    it { expect(Stringprep::in_c8("\u0340")).to be_true }
    it { expect(Stringprep::in_c8("\u0342")).to be_false }
  end

  describe '.in_c9' do
    it { expect(Stringprep::in_c9("\u{e0001}")).to be_true }
    it { expect(Stringprep::in_c9("\u{e0002}")).to be_false }
  end

  describe '.in_d1' do
    it { expect(Stringprep::in_d1("\u05be")).to be_true }
    it { expect(Stringprep::in_d1("\u05bf")).to be_false }
  end

  describe '.in_d2' do
    it { expect(Stringprep::in_d2("\u0041")).to be_true }
    it { expect(Stringprep::in_d2("\u0040")).to be_false }
  end
end
