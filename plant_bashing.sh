#!/bin/bash

echo "Welcome to the Plants vs Zombie's the Sequel"
sleep 2
echo "What is your farmer name?"
read name



while true; do
	
	echo "Hello, $name!"
	sleep 2
	
	read -p "Would you like to plant a seed? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You've dug a small hole and planted a Sunflower seed the size of an inch."
	else
		echo "Goodbye, $name."
		exit
	fi

	sleep 2

	echo "In the Plants vs Zombie's dimension, time moves faster... for every 1 minute equals to 1 hour"
	sleep 2

	read -p "Would you like to wait for you Sunflower to grow? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You sleep for the day, hoping your Sunflower will grow"
	else
		echo "You leave your house never seen again..."
		exit
	fi

	sleep 2
	echo "You wake up and run to your Sunflower to find that nothings happend..."

	read -p "Would you like to wait another day? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You sleep for the day once again, hoping your Sunflower will grow"
	else
		echo "You moved out, leaving the plant behind."
		exit
	fi

	sleep 2
	echo "You wake up and see..."

	sleep 2
	echo "You've reached the stage of germination overnight!"
	sleep 2
	echo "You jump with joy and realize you've started your journey to become an elite farmer!"
	sleep 2
	read -p "Would you like to wait another day? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You sleep for the day yet another time, hoping your Sunflower will reach the next stage..."
	else
		echo "You give up on your dream, leaving the plant behind..."
		exit
	fi

	sleep 2
	echo "You rise out of your bed, looking out of window to see nothing has happened yet again..."
	sleep 2

	read -p "Would you like to wait another day? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You sleep again knowing that tomorrow is the day... Tomorrow is the day you become the best farmer!"
	else
		echo "You start to realize you cannot do this anymore..."
		exit
	fi
	sleep 2

	echo "You wake up, run out of bed, open up your backyard door and see that the next stage has arrived... the SAPLING stage!"
	sleep 2

	read -p "Would you like to watch the sapling grow? (Yes/No):" answer

	if [ "$answer" == "Yes" ]; then
		echo "You watch your very own Sunflower grow, growing attachments to it, you decide to sleep on your porch next to your own Sunflower."
	else
		echo "You leave your plant behind, ignoring the idea of it in general"
		exit
	fi
	sleep 2
	echo "You wake up next to your Sunflower looking at it and seeing leaves! You decide to put a meter stick in the ground beside the Sunflower, recording the growth. Today marks 2cm and 2 leaves."

	plant_height=2
	plant_leaves=2
	day=5

	while true; do
	    read -p "Would you like to sleep, letting your Sunflower continue to grow? (Yes/No): " answer

	    if [[ $day -ge 21 ]]; then
	    	echo "Sorry, your Sunflower has reached its growth limit!"
	    	break
	    fi

	    if [[ "$answer" == "Yes" ]]; then
	        ((day++))
	        ((plant_height+=2))
	        ((plant_leaves+=2))
	        echo ""
	        echo "Day $day: Your plant is now $plant_height cm tall with $plant_leaves leaves."
	        echo ""
	    elif [[ "$answer" == "No" ]]; then
	        echo "Okay, your plant is resting. Come back later!"
	        break
	    else
	        echo "Please answer with 'Yes' or 'No'."
	    fi
	done

	read -p "Would you like to play agian? (Yes/No):" play_again
	if [[ "$play_again" != "Yes" ]]; then
		echo "Thanks for playing, $name. Goodbye!"
		break
	fi

done