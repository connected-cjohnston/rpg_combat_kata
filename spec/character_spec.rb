require './src/character'

RSpec.describe Character do
  subject { Character.new }

  it 'should work' do
    expect(true).to eq(true)
  end

  it 'should start with 1000 health' do
    expect(subject.health).to eq(1000)
  end

  it 'should start at level 1' do
    expect(subject.level).to eq(1)
  end

  it 'should start alive' do
    expect(subject.alive?).to eq(true)
  end

  it 'should receive damage' do
    subject.damage(100)
    expect(subject.health).to eq(900)
  end

  it 'should die when health is at or below zero' do
    subject.damage(1000)
    expect(subject.alive?).to eq(false)
  end

  it 'can be healed after being damaged' do
    subject.damage(200)
    subject.heal(100)
    expect(subject.health).to eq(900)
  end

  it 'cannot be healed above current max health' do
    subject.heal(100)
    expect(subject.health).to eq(1000)
  end

  it 'cannot be healed back to life once dead' do
    subject.damage(1000)
    subject.heal(200)
    expect(subject.alive?).to eq(false)
  end
end
