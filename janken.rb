class Player
  def hand
    while true do
      puts "数字を入力してください。"
      Janken::HANDS.each_with_index do |hand, i|
        puts "#{i}:#{hand}"
      end

      player_hand = gets.chomp
​
      if valid?(player_hand)
        puts "あなたは#{Janken.hand_text(hand)}を出しました"
        break
      else
        puts "【Warning】#{Janken.hand_values.join(',')}の数字を入力してください。"
      end
    end
    player_hand.to_i
  end

  def valid?(player_hand)
    if Janken.hand_values.map(&:to_s).include?(player_hand)
      true
    else
      false
    end
  end
end

class Enemy
  def hand
    index = rand(Janken::HANDS.length)
    hand = Janken.to_a[index].last
    puts "PCは#{Janken.hand_text(hand)}を出しました"
    hand
  end
end

class Janken
  HANDS = {
    'グー' => 0,
    'チョキ' => 1,
    'パー' => 2
  }.freeze

  class << self
    def hand_values
      HANDS.values
    end

    def hand_names
      HANDS.keys
    end

    def hand_text(hand)
      HANDS.invert[hand]
    end
  end

  def pon(player_hand, enemy_hand)
    result = judge(player_hand, enemy_hand)
    case result
    when 2
      puts "あなたの勝ちです"
      false
    when 1
      puts "あなたの負けです"
      false
    when 0
      puts "あいこです"
      true
    end
  end

  private

  def judge(player_hand, enemy_hand)
    (player_hand - enemy_hand + 3) % 3
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true

while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end