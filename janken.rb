JANKEN = ['グー', 'チョキ', 'パー']

class Player
  def hand
    while true do
      puts "数字を入力してください。"
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"

      player_hand = gets.chomp

      if valid?(player_hand)
        puts "あなたは#{JANKEN[player_hand.to_i]}を出しました"
        break
      else
        puts "0〜2の数字を入力してください。"
      end
    end
    player_hand.to_i
  end

  def valid?(player_hand)
    if ['0', '1', '2'].include?(player_hand)
      true
    else
      false
    end
  end
end

class Enemy
  def hand
    hand = rand(0..2)
    puts "PCは#{JANKEN[hand]}を出しました"
    hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    result = (player_hand - enemy_hand + 3) % 3
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
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true

while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end