## Pao ying Chub Game
import random

def pao_ying_chub_game():
    print("Welcome to Pao Ying Chub Game!")
    hand = ["rock", "paper", "scissor"]
    user_score = 0
    computer_score = 0
    game_count = 0

    while game_count < 3:
        user_choice = input("Enter your choice (rock/paper/scissor: )")
        print(f"You choose {user_choice}")

        computer_choice = random.choice(hand)
        print(f"Computer choose {computer_choice}")

        if user_choice == computer_choice:
            print("We are draw!")

        elif user_choice == "rock" and computer_choice == "scissor":
            print("You're win!")
            user_score += 1

        elif user_choice == "paper" and computer_choice == "rock":
            print("You're win!")
            user_score += 1

        elif user_choice == "scissor" and computer_choice == "paper":
            print("You're win!")
            user_score += 1

        else:
            print("I'm win!")
            computer_score += 1

        print(f"Your score: {user_score}")
        print(f"Computer score: {computer_score}")

        game_count += 1

        Play_again = input("Do you want to play again? [Yes or No] " )
        if Play_again.lower() != "yes":
            break
    return f"Thank you for playing! This game is very fun! Your scores are {user_score}, My scores are {computer_score}"
