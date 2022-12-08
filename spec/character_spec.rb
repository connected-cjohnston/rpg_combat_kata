require './src/character'

RSpec.describe Character do
  let(:player_2) { Character.new }
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
    subject.damage(100, player_2)
    expect(subject.health).to eq(900)
  end

  it 'should die when health is at or below zero' do
    subject.damage(1000, player_2)
    expect(subject.alive?).to eq(false)
  end

  it 'can be healed after being damaged' do
    subject.damage(200, player_2)
    subject.heal(100)
    expect(subject.health).to eq(900)
  end

  it 'cannot be healed above current max health' do
    subject.heal(100)
    expect(subject.health).to eq(1000)
  end

  it 'cannot be healed back to life once dead' do
    subject.damage(1000, player_2)
    subject.heal(200)
    expect(subject.alive?).to eq(false)
  end

  it 'cannot deal damage to itself' do
    subject.damage(200, subject)
    expect(subject.health).to eq(1000)
  end

  it 'should do 50% more damage when attacker is 5 levels above target' do
    player_2.level = 6
    subject.damage(200, player_2)
    expect(subject.health).to eq(700)
  end

  it 'should do 50% less damage when attacker is 5 levels below target' do
    subject.level = 6
    subject.damage(200, player_2)
    expect(subject.health).to eq(900)
  end
end
