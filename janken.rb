class Player
  def hand
    while true do
      puts "数字を入力してください。"
      Janken::HANDS.each do |k, v|
        puts "#{v}:#{k}"
      end

      hand = gets.chomp.to_i

      if valid?(hand)
        puts "あなたは#{Janken::HANDS.key(hand)}を出しました"
        break
      else
        puts "【Warning】#{Janken::HANDS.values}の数字を入力してください。"
      end
    end

    hand
  end

  private 

  def valid?(player_hand)
    Janken::HANDS.values.include?(player_hand) ? true : false
  end
end

class Enemy
  def hand
    hand = Janken::HANDS.values.sample
    puts "PCは#{Janken::HANDS.key(hand)}を出しました"
    hand
  end
end

class Janken
  HANDS = { "グー": 0, "チョキ": 1, "パー": 2 }.freeze

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