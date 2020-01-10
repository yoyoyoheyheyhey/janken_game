
module Janken
  HANDS = { "グー": 0, "チョキ": 1, "パー": 2 }.freeze

  def hands
    HANDS.values
  end

  def hand_name(hand)
    HANDS.key(hand)
  end

  class << self
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

    def judge(player_hand, enemy_hand)
      (player_hand - enemy_hand + 3) % 3
    end

    private :judge
  end
end

class Player
  include Janken

  def hand
    while true do
      puts "数字を入力してください。"
      HANDS.each do |k, v|
        puts "#{v}:#{k}"
      end

      hand = gets.chomp.to_i

      if valid?(hand)
        puts "あなたは#{hand_name(hand)}を出しました"
        break
      else
        puts "【Warning】#{hands}の数字を入力してください。"
      end
    end

    hand
  end

  def valid?(player_hand)
    hands.include?(player_hand) ? true : false
  end

  private :valid?
end

class Enemy
  include Janken

  def hand
    hand = hands.sample
    puts "PCは#{hand_name(hand)}を出しました"
    hand
  end
end


def main
  player = Player.new
  enemy = Enemy.new

  next_game = true

  while next_game
    next_game = Janken.pon(player.hand, enemy.hand)
  end
end

main if __FILE__ == $0