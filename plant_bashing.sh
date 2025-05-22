#!/bin/bash

names=("Morpheus" "Analiea" "Izzy")
counter=0

get_next_name() {
	plant_name=${names[$counter]}
	((counter++))
	if ((counter >= ${#names[@]})); then
		counter=0
	fi
}

goodbye() {
	sleep 2
	echo "Farewell fellow farmer!"
	sleep 3
	exit
}

is_yes() {
    local answer="${1,,}"
    case "$answer" in
        "yes"|"y"|"yeah"|"yup"|"yep"|"ye"|"ya"|"aye"|"affirmative"|"surely"|"indeed"|"absolutely"|"certainly"|"of course"|"uh-huh"|"ok"|"okay"|"roger"|"right"|"mhm"|"sure"|"you bet"|"yessir"|"yessum"|"yay"|"woohoo"|"hell yeah"|"heck yes"|"right on"|"totally"|"bet"|"yes")
            return 0 ;;
        *)
            return 1 ;;
    esac
}

echo "Welcome to Plants vs Zombie's the Sequel"
sleep 2
echo "What is your farmer name?"
read name

first_play=true

while true; do

	echo "Hey, $name!"
	sleep 2

	read -p "Would you like to start off with planting a seed?" answer

	if is_yes "$answer"; then
		echo "Great! You've planted a seed that will soon be huge!"
	else
		echo "You pass up on the idea, and forget about it..."
		goodbye
	fi

	if [ "$first_play" == false ]; then
		read -p "Awesome! Would you like to change your plants name?" answer
		if is_yes "$answer"; then
			echo "What would you like to name your plant?"
			read plant_name
			echo "Your plant is named $plant_name!"
		else
			get_next_name
			echo "Your plant is named $plant_name!"
			sleep 2
		fi
	fi

	sleep 2
	echo "You take a quick nap before setting up your seed"
	sleep 2

	echo "In the Plants vs Zombie's dimension, time moves faster... for every 1 minute equals to 1 hour"
	sleep 2

	read -p "Would you like to wait for you seed to grow?" answer

	if is_yes "$answer"; then
		echo "You sleep for the day, hoping your seed will grow"
	else
		echo "You leave your house never seen again..."
		goodbye
	fi

	sleep 2
	echo "You wake up and run to your seed to find that nothings happend..."

	read -p "Would you like to wait another day?" answer

	if is_yes "$answer"; then
		echo "You sleep for the day once again, hoping your seed will grow"
	else
		echo "You moved out, leaving the plant behind."
		goodbye
	fi

	sleep 2
	echo "You wake up and see..."

	sleep 2
	echo "You've reached the stage of germination overnight!"
	sleep 2
	echo "You jump with joy and realize you've started your journey to become an elite farmer!"
	sleep 2

	if [ "$first_play" == true ]; then
        read -p "Would you like to name your plant?" answer
        if is_yes "$answer"; then
            echo "What would you like to name your plant?"
            read plant_name
            echo "Your plant is named $plant_name!"
        else
            get_next_name
            echo "Your plant is named $plant_name"
        fi
        first_play=false
    fi

	read -p "Would you like to wait another day?" answer

	if is_yes "$answer"; then
		echo "You sleep for the day yet another time, hoping your $plant_name will reach the next stage..."
	else
		echo "You give up on your dream, leaving the plant behind..."
		goodbye
	fi

	sleep 2
	echo "You rise out of your bed, looking out of window to see nothing has happened yet again..."
	sleep 2

	read -p "Would you like to wait another day?" answer

	if is_yes "$answer"; then
		echo "You sleep again knowing that tomorrow is the day... Tomorrow is the day you become the best farmer!"
	else
		echo "You start to realize you cannot do this anymore..."
		goodbye
	fi
	sleep 2

	echo "You wake up, run out of bed, open up your backyard door and see that the next stage has arrived... the SAPLING stage!"
	sleep 2

	read -p "Would you like to watch the sapling grow?" answer

	if is_yes "$answer"; then
		echo "You watch your very own Sunflower grow, growing attachments to it, you decide to sleep on your porch next to your own $plant_name."
	else
		echo "You leave your plant behind, ignoring the idea of it in general"
		goodbye
	fi
	sleep 2
	echo "You wake up next to your $plant_name looking at it and seeing leaves! You decide to put a meter stick in the ground beside the $plant_name, recording the growth. Today marks 2cm and 2 leaves."

	plant_height=2
	plant_leaves=2
	growth_rate=1.0
	weather_conditions=("Rainy" "Sunny" "Cloudy" "Overcast" "Windstorm" "Foggy")

	total_days=0
	windstorm_count=0

	    while (($(echo "$plant_height < 35" | bc -l) )); do
	    	read -p "Press Enter to sleep and check weather for your plant's growth: "
	        random_index=$((RANDOM % ${#weather_conditions[@]}))
	        weather=${weather_conditions[$random_index]}
	        total_days=$((total_days + 1))

	        echo ""
	        echo "Weather today: $weather"

	        case "$weather" in
	        	"Rainy")
					echo "It's a rainy day today! No growth but the soil is richer!"
					growth_rate=$(echo "$growth_rate + 2" | bc)
					;;
				"Sunny")
					echo "It's sunny! Amazing conditions for growth!"
					plant_height=$(echo "$plant_height + 1.5" | bc)
	          	 	leaf_increase=$(echo "2 + (2.5 * $growth_rate)" | bc)
	            	plant_leaves=$(echo "$plant_leaves + $leaf_increase" | bc)
	            	growth_rate=$(echo "$growth_rate + 3" | bc)
	            	;;
	            "Cloudy")
		            echo "It's cloudy. Not ideal for growing. No changes."
		            ;;
		        "Overcast")
		            echo "It's overcast, but some growth still happens."
		            plant_height=$(echo "$plant_height + 1.5" | bc)
		            leaf_increase=$(echo "2 + (2.5 * $growth_rate)" | bc)
		            plant_leaves=$(echo "$plant_leaves + $leaf_increase" | bc)
		            windstorm_count=$((windstorm_count + 1))
		            ;;
		         "Windstorm")
		            echo "A windstorm! No growth. Some damage to your plant!"
		            growth_rate=$(echo "$growth_rate - 2" | bc)
		            plant_leaves=$(echo "$plant_leaves - 3" | bc)
		            ;;
		        "Foggy")
		            echo "It's foggy. No growth. Reduced sunlight."
		            growth_rate=$(echo "$growth_rate - 1" | bc)
		            ;;
		    esac

		    if (( $(echo "$growth_rate < 0" | bc -l) )); then
		    	growth_rate=0
		    fi
		    if (( $(echo "$plant_leaves < 0" | bc -l) )); then
		    	plant_leaves=0
			fi

			echo "Current height: $plant_height cm | Leaves: $plant_leaves | Growth Rate: $growth_rate"
		    echo ""
		    sleep 2
		done

		echo ""
		echo "Congrats! Your $plant_name has reached $plant_height cm and is fully grown!"
		echo ""
		sleep 2
		echo "Generating final stats"
		sleep 2
		echo "..."
		sleep 2
		echo "Final Height: $plant_height"
		sleep 2
		echo "Total Leaves: $plant_leaves"
		sleep 2
		echo "Windstorms Survied: $windstorm_count"
		sleep 2
		echo "And last of all..!"
		sleep 2
		echo "..."
		sleep 2
		echo "You've played for $total_days!"
		sleep 2

	read -p "Would you like to play agian? (Yes/No)" play_again
	if [[ "$play_again" != "Yes" ]]; then
		echo "Thanks for playing, $name. Goodbye!"
		sleep 2
		exit
	fi
done