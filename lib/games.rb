def format_time(game)
  if game[:min_time] && game[:max_time]
    "#{game[:min_time]} - #{game[:max_time]} minutes"
  elsif game[:min_time]
    "#{game[:min_time]}+ minutes"
  end
end

def format_players(game)
  if game[:min_player] && game[:max_player]
    "#{game[:min_player]} - #{game[:max_player]} players"
  elsif game[:min_player]
    "#{game[:min_player]}+ players"
  end
end

def format(game)
  data = []

  data << ['ID', game[:id]]
  data << ['Title', game[:name]]
  data << ['Ranking', game[:ranking]]
  data << ['# of Players', format_players(game)]
  data << ['Duration', format_time(game)]
  data << ['Description', game[:description]]
  data << ['Link', game[:link]]


  data.map{ |info| info.join(': ')}.join("\n")
end

GAMES = [
    {
        :id => 0,
        :name => 'Agricola',
        :ranking => 6,
        :min_player => 1,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/31260/agricola',
        :min_time => 30,
        :max_time => 150,
        :description => "In Agricola, you're a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you'll find on a farm: collecting clay, wood, or stone; building fences; and so on. You might think about having kids in order to get more work accomplished, but first you need to expand your house. And what are you going to feed all the little rugrats?

The game supports many levels of complexity, mainly through the use (or non-use) of two of its main types of cards, Minor Improvements and Occupations. In the beginner's version (called the Family Variant in the U.S. release), these cards are not used at all. For advanced play, the U.S. release includes three levels of both types of cards; Basic (E-deck), Interactive (I-deck), and Complex (K-deck), and the rulebook encourages players to experiment with the various decks and mixtures thereof. Aftermarket decks such as the Z-Deck and the L-Deck also exist.

Agricola is a turn-based game. There are 14 game rounds occurring in 6 stages, with a Harvest at the end of each stage (after Rounds 4, 7, 9, 11, 13, and 14).

Each player starts with two playing tokens (farmer and spouse) and thus can take two turns, or actions, per round. There are multiple options, and while the game progresses, you'll have more and more: first thing in a round, a new action card is flipped over.

Problem: Each action can be taken by only one player each round, so it's important to do some things with high preference.

Each player also starts with a hand of 7 Occupation cards (of more than 160 total) and 7 Minor Improvement cards (of more than 140 total) that he/she may use during the game if they fit in his/her strategy. Speaking of which, there are countless strategies, some depending on your card hand. Sometimes it's a good choice to stay on course, and sometimes it is better to react to your opponents' actions."
    },
    {
        :id => 1,
        :name => 'Dominion',
        :ranking => 30,
        :min_player => 2,
        :max_player => 4,
        :link => 'https://boardgamegeek.com/boardgame/36218/dominion',
        :min_time => 30,
        :max_time => nil,
        :description => "In Dominion, each player starts with an identical, very small deck of cards. In the center of the table is a selection of other cards the players can \"buy\" as they can afford them. Through their selection of cards to buy, and how they play their hands as they draw them, the players construct their deck on the fly, striving for the most efficient path to the precious victory points by game end.

Dominion is not a CCG, but the play of the game is similar to the construction and play of a CCG deck. The game comes with 500 cards. You select 10 of the 25 Kingdom card types to include in any given play-leading to immense variety."
    },
    {
        :id => 2,
        :name => '7 Wonders',
        :ranking => 19,
        :min_player => 2,
        :max_player => 7,
        :link => 'https://boardgamegeek.com/boardgame/68448/7-wonders',
        :min_time => 30,
        :max_time => nil,
        :description => "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.

7 Wonders lasts three ages. In each age, players receive seven cards from a particular deck, choose one of those cards, then pass the remainder to an adjacent player. Players reveal their cards simultaneously, paying resources if needed or collecting resources or interacting with other players in various ways. (Players have individual boards with special powers on which to organize their cards, and the boards are double-sided). Each player then chooses another card from the deck they were passed, and the process repeats until players have six cards in play from that age. After three ages, the game ends.

In essence, 7 Wonders is a card development game. Some cards have immediate effects, while others provide bonuses or upgrades later in the game. Some cards provide discounts on future purchases. Some provide military strength to overpower your neighbors and others give nothing but victory points. Each card is played immediately after being drafted, so you'll know which cards your neighbor is receiving and how his choices might affect what you've already built up. Cards are passed left-right-left over the three ages, so you need to keep an eye on the neighbors in both directions."
    },
    {
        :id => 3,
        :name => 'Avalon',
        :ranking => 32,
        :min_player => 5,
        :max_player => 10,
        :link => 'https://boardgamegeek.com/boardgame/128882/resistance-avalon',
        :min_time => 30,
        :max_time => nil,
        :description => "The Resistance: Avalon pits the forces of Good and Evil in a battle to control the future of civilization. Arthur represents the future of Britain, a promise of prosperity and honor, yet hidden among his brave warriors are Mordred's unscrupulous minions. These forces of evil are few in number but have knowledge of each other and remain hidden from all but one of Arthur's servants. Merlin alone knows the agents of evil, but he must speak of this only in riddles. If his true identity is discovered, all will be lost."
    },
    {
        :id => 4,
        :name => 'Bang!',
        :ranking => 722,
        :min_player => 4,
        :max_player => 7,
        :link => 'https://boardgamegeek.com/boardgame/3955/bang',
        :min_time => 20,
        :max_time => 40,
        :description => "\"The Outlaws hunt the Sheriff. The Sheriff hunts the Outlaws. The Renegade plots secretly, ready to take one side or the other. Bullets fly. Who among the gunmen is a Deputy, ready to sacrifice himself for the Sheriff? And who is a merciless Outlaw, willing to kill him? If you want to find out, just draw (your cards)!\" (From back of box)

The card game BANG! recreates an old-fashioned spaghetti western shoot-out, with each player randomly receiving a Character card to determine special abilities, and a secret Role card to determine their goal.

Four different Roles are available, each with a unique victory condition:
Sheriff - Kill all Outlaws and the Renegade
Deputy - Protect the Sheriff and kill any Outlaws
Outlaw - Kill the Sheriff
Renegade - Be the last person standing
A player's Role is kept secret, except for the Sheriff. Character cards are placed face up on table, and also track strength (hand limit) in addition to special ability.

There are 22 different types of cards in the draw deck. Most common are the BANG! cards, which let you shoot at another player, assuming the target is within \"range\" of your current gun. The target player can play a \"MISSED!\" card to dodge the shot. Other cards can provide temporary boosts while in play (for example, different guns to improve your firing range) and special one-time effects to help you or hinder your opponents (such as Beer to restore health, or Barrels to hide behind during a shootout). A horse is useful for keeping your distance from unruly neighbors, while the Winchester can hit a target at range 5. The Gatling is a deadly exception where range doesn't matter: it can only be used once, but targets all other players at the table!"
    },
    {
        :id => 5,
        :name => 'Dead of Winter: A Crossroads Game',
        :ranking => 18,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/150376/dead-winter-crossroads-game',
        :min_time => 100,
        :max_time => nil,
        :description => "Dead of Winter: A Crossroads Game, the first game in this series, puts 2-5 players in a small, weakened colony of survivors in a world where most of humanity is either dead or diseased, flesh-craving monsters. Each player leads a faction of survivors with dozens of different characters in the game.

Dead of Winter is a meta-cooperative psychological survival game. This means players are working together toward one common victory condition - but for each individual player to achieve victory, he must also complete his personal secret objective. This secret objective could relate to a psychological tick that's fairly harmless to most others in the colony, a dangerous obsession that could put the main objective at risk, a desire for sabotage of the main mission, or (worst of all) vengeance against the colony! Certain games could end with all players winning, some winning and some losing, or all players losing. Work toward the group's goal, but don't get walked all over by a loudmouth who's looking out only for his own interests!

Dead of Winter is an experience that can be accomplished only through the medium of tabletop games. It's a story-centric game about surviving through a harsh winter in an apocalyptic world. The survivors are all dealing with their own psychological imperatives, but must still find a way to work together to fight off outside threats, resolve crises, find food and supplies, and keep the colony's morale up.

Dead of Winter has players making frequent, difficult, heavily- thematic, wildly-varying decisions that often have them deciding between what is best for the colony and what is best for themselves."
    },
    {
        :id => 6,
        :name => 'Roll for the Galaxy',
        :ranking => 50,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/132531/roll-galaxy',
        :min_time => 2,
        :max_time => 5,
        :description => "Roll for the Galaxy is a dice game of building space empires for 2 - 5 players. Your dice represent your populace, whom you direct to develop new technologies, settle worlds, and ship goods. The player who best manages his workers and builds the most prosperous empire wins!"
    },
    {
        :id => 7,
        :name => 'Specter Ops',
        :ranking => 427,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/155624/specter-ops',
        :min_time => 60,
        :max_time => 90,
        :description => "A secret agent of A.R.K. has infiltrated a top secret Raxxon facility, attempting to complete three mission objectives before they escape - but they are hunted by genetically modified Raxxon Hunters. Players can choose which side they wish to join.

Specter Ops is a sci-fi, stealth ops game of hidden movement that's similar to Scotland Yard. Players are trying to locate/capture a mysterious agent, who keeps track of their sneaking via a private map. The other players take control of unique characters who must use their wits, abilities and technology to help them Hunt Down this infiltrator. Items like flash grenades, scanners, and the like are at the disposal of this covert agent."
    },
    {
        :id => 8,
        :name => 'Terra Mystica',
        :ranking => 2,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/120677/terra-mystica',
        :min_time => 60,
        :max_time => 150,
        :description => "In the land of Terra Mystica dwell 14 different peoples in seven landscapes, and each group is bound to its own home environment, so to develop and grow, they must terraform neighboring landscapes into their home environments in competition with the other groups.

Terra Mystica is a game with very little luck that rewards Strategic Planning. Each player governs one of the 14 groups. With subtlety and craft, the player must attempt to rule as great an area as possible and to develop that group's skills. There are also four religious cults in which you can progress. To do all that, each group has special skills and abilities.

Taking turns, the players execute their actions on the resources they have at their disposal. Different buildings allow players to develop different resources. Dwellings allow for more workers. Trading houses allow players to make money. Strongholds unlock a group's special ability, and temples allow you to develop religion and your terraforming and seafaring skills. Buildings can be upgraded: Dwellings can be developed into trading houses; trading houses can be developed into strongholds or temples; one temple can be upgraded to become a sanctuary. Each group must also develop its terraforming skill and its skill with boats to use the rivers. The groups in question, along with their home landscape, are:

Desert (Fakirs, Nomads)
Plains (Halflings, Cultists)
Swamp (Alchemists, Darklings)
Lake (Mermaids, Swarmlings)
Forest (Witches, Auren)
Mountain (Dwarves, Engineers)
Wasteland (Giants, Chaos Magicians)

Proximity to other groups is a double-edged sword in Terra Mystica. Being close to other groups gives you extra power, but it also means that expanding is more difficult..."
    },
    {
        :id => 9,
        :name => 'Ticket to Ride: Europe',
        :ranking => 63,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/14996/ticket-ride-europe',
        :min_time => 30,
        :max_time => 60,
        :description => "Ticket to Ride: Europe takes you on a new train adventure across Europe. From Edinburgh to Constantinople and from Lisbon to Moscow, you'll visit great cities of turn-of-the-century Europe. Like the original Ticket to Ride, the game remains elegantly simple, can be learned in 5 minutes, and appeals to both families and experienced gamers. Ticket to Ride: Europe is a complete, new game and does not require the original version.

More than just a new map, Ticket to Ride: Europe features brand new gameplay elements. Tunnels may require you to pay extra cards to build on them, Ferries require locomotive cards in order to claim them, and Stations allow you to sacrifice a few points in order to use an opponents route to connect yours. The game also includes larger format cards and Train Station game pieces.

The overall goal remains the same, collect and play train cards in order to place your pieces on the board, attempting to connect cities on your ticket cards. Points are earned both from placing trains and completing tickets but uncompleted tickets lose you points. The player who has the most points at the end of the game wins."
    },
    {
        :id => 10,
        :name => 'King of New York',
        :ranking => 197,
        :min_player => 2,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/160499/king-new-york',
        :min_time => 40,
        :max_time => nil,
        :description => "There's always something happening in the city that never sleeps. Maybe it's the lights, maybe it's the energy, or maybe it's the giant monsters trying to demolish the place!

King of New York is a standalone game from designer Richard Garfield that keeps the core ideas of King of Tokyo while introducing new ways to play. As in KoT, your goal is to be the first monster to collect 20 victory points (VPs) or to be the last monster standing. On your turn, you roll six dice up to three times, then carry out the actions on those dice. Claws cause damage to other monsters, hearts heal damage to yourself, and energy is stored up so that you can purchase power cards that provide unique effects not available to anyone else.

What's new in King of New York is that you can now try to become a star in the big city; more specifically, you can achieve \"Fame\", which nets you VPs, but superstar status is fleeting, so enjoy your time in the spotlight.

The game board for King of New York is larger than in KoT with each monster occupying a district in the city and everyone trying to shine in Manhattan. When you attack, you can displace a monster in another district, whether to escape military forces or to find new smashing opportunities. Yes, smashing because you can now destroy buildings and get bonuses for doing so, but the more destruction you cause, the more intense the military response.

The monsters from King of New York can be used in KoT and vice versa, but the power cards are specific to this game."
    },
    {
        :id => 11,
        :name => 'Power Grid',
        :ranking => 11,
        :min_player => 2,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/2651/power-grid',
        :min_time => 120,
        :max_time => nil,
        :description => "Power Grid is the updated release of the Friedemann Friese crayon game Funkenschlag. It removes the crayon aspect from network building in the original edition, while retaining the fluctuating commodities market like Crude: The Oil Game and an auction round intensity reminiscent of The Princes of Florence.

The object of Power Grid is to supply the most cities with power when someone's network gains a predetermined size. In this new edition, players mark pre-existing routes between cities for connection, and then bid against each other to purchase the power plants that they use to power their cities.

However, as plants are purchased, newer, more efficient plants become available, so by merely purchasing, you're potentially allowing others access to superior equipment.

Additionally, players must acquire the raw materials (coal, oil, garbage, and uranium) needed to power said plants (except for the 'renewable' windfarm/ solar plants, which require no fuel), making it a constant struggle to upgrade your plants for maximum efficiency while still retaining enough wealth to quickly expand your network to get the cheapest routes."
    },
    {
        :id => 12,
        :name => 'Settlers of Catan',
        :ranking => 164,
        :min_player => 2,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/13/catan',
        :min_time => 90,
        :max_time => nil,
        :description => "In Catan (formerly The Settlers of Catan), players try to be the dominant force on the island of Catan by building settlements, cities, and roads. On each turn dice are rolled to determine what resources the island produces. Players collect these resources (cards)-wood, grain, brick, sheep, or stone-to build up their civilizations to get to 10 victory points and win the game.

Setup includes randomly placing large hexagonal tiles (each showing a resource or the desert) in a honeycomb shape and surrounding them with water tiles, some of which contain ports of exchange. Number disks, which will correspond to die rolls (two 6-sided dice are used), are placed on each resource tile. Each player is given two settlements (think: houses) and roads (sticks) which are, in turn, placed on intersections and borders of the resource tiles. Players collect a hand of resource cards based on which hex tiles their last-placed house is adjacent to. A robber pawn is placed on the desert tile.

A turn consists of possibly playing a development card, rolling the dice, everyone (perhaps) collecting resource cards based on the roll and position of houses (or upgraded cities-think: hotels) unless a 7 is rolled, turning in resource cards (if possible and desired) for improvements, trading cards at a port, and trading resource cards with other players. If a 7 is rolled, the active player moves the robber to a new hex tile and steals resource cards from other players who have built structures adjacent to that tile.

Points are accumulated by building settlements and cities, having the longest road and the largest army (from some of the development cards), and gathering certain development cards that simply award victory points. When a player has gathered 10 points (some of which may be held in secret), he announces his total and claims the win."
    },
    {
        :id => 13,
        :name => 'One Night Ultimate Werewolf',
        :ranking => 129,
        :min_player => 3,
        :max_player => 10,
        :link => 'https://boardgamegeek.com/boardgame/147949/one-night-ultimate-werewolf',
        :min_time => 10,
        :max_time => nil,
        :description => "No moderator, no elimination, ten-minute games.

One Night Ultimate Werewolf is a fast game for 3-10 players in which everyone gets a role: One of the dastardly Werewolves, the tricky Troublemaker, the helpful Seer, or one of a dozen different characters, each with a special ability. In the course of a single morning, your village will decide who is a werewolf...because all it takes is lynching one werewolf to win!

Because One Night Ultimate Werewolf is so fast, fun, and engaging, you'll want to play it again and again, and no two games are ever the same."
    },
    {
        :id => 14,
        :name => 'One Night Ultimate Werewolf Daybreak',
        :ranking => 447,
        :min_player => 3,
        :max_player => 7,
        :link => 'https://boardgamegeek.com/boardgame/163166/one-night-ultimate-werewolf-daybreak',
        :min_time => 10,
        :max_time => nil,
        :description => "One Night Ultimate Werewolf Daybreak is a fast game for 3-7 players in which everyone gets a hidden role, each with a special ability. (No plain \"villagers\" here!) In the course of a single morning, your village will decide who among them is a werewolf...because all it takes is finding one werewolf to win!

Daybreak includes eleven new roles, and it can be played on its own or combined with the original One Night Ultimate Werewolf game; when combined, you can have up to ten players in a single game."
    },
    {
        :id => 15,
        :name => 'Puero Rico',
        :ranking => 5,
        :min_player => 2,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/3076/puerto-rico',
        :min_time => 90,
        :max_time => 150,
        :description => "In Puerto Rico players assume the roles of colonial governors on the island of Puerto Rico. The aim of the game is to amass victory points by shipping goods to Europe or by constructing buildings.

Each player uses a separate small board with spaces for city buildings, plantations, and resources. Shared between the players are three ships, a trading house, and a supply of resources and doubloons.

The resource cycle of the game is that players grow crops which they exchange for points or doubloons. Doubloons can then be used to buy buildings, which allow players to produce more crops or give them other abilities. Buildings and plantations do not work unless they are manned by colonists.

During each round, players take turns selecting a role card from those on the table (such as \"Trader\" or \"Builder\"). When a role is chosen, every player gets to take the action appropriate to that role. The player that selected the role also receives a small privilege for doing so - for example, choosing the \"Builder\" role allows all players to construct a building, but the player who chose the role may do so at a discount on that turn. Unused roles gain a doubloon bonus at the end of each turn, so the next player who chooses that role gets to keep any doubloon bonus associated with it. This encourages players to make use of all the roles throughout a typical course of a game.

Puerto Rico uses a variable phase order mechanic, where a \"governor\" token is passed clockwise to the next player at the conclusion of a turn. The player with the token begins the round by choosing a role and taking the first action.

Players earn victory points for owning buildings, for shipping goods, and for manned \"large buildings.\" Each player's accumulated shipping chips are kept face down and come in denominations of one or five. This prevents other players from being able to determine the exact score of another player. Goods and doubloons are placed in clear view of other players and the totals of each can always be requested by a player. As the game enters its later stages, the unknown quantity of shipping tokens and its denominations require players to consider their options before choosing a role that can end the game."
    },
    {
        :id => 16,
        :name => 'Sheriff of Nottingham',
        :ranking => 119,
        :min_player => 3,
        :max_player => 5,
        :link => 'https://boardgamegeek.com/boardgame/157969/sheriff-nottingham',
        :min_time => 60,
        :max_time => nil,
        :description => "Prince John is coming to Nottingham! Players, in the role of merchants, see this as an opportunity to make quick profits by selling goods in the bustling city during the Prince's visit. However, players must first get their goods through the city gate, which is under the watch of the Sheriff of Nottingham. Should you play it safe with legal goods and make a profit, or risk it all by sneaking in illicit goods? Be mindful, though, as the Sheriff always has his eyes out for liars and tricksters and if he catches one, he very well may confiscate those goods for himself!

In Sheriff of Nottingham, players will not only be able to experience Nottingham as a merchant of the city, but each turn one player will step into the shoes of the Sheriff himself. Players declare goods they wish to bring into the city, goods that are secretly stored in their burlap sack. The Sheriff must then determine who gets into the city with their goods, who gets inspected, and who may have their goods confiscated!

Do you have what it takes to be seen as an honest merchant? Will you make a deal with the Sheriff to let you in? Or will you persuade the Sheriff to target another player while you quietly slip by the gate? Declare your goods, negotiate deals, and be on the lookout for the Sheriff of Nottingham!"
    },
    {
        :id => 17,
        :name => 'A Game of Thrones: The Board Game',
        :ranking => 37,
        :min_player => 3,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/103343/game-thrones-board-game-second-edition',
        :min_time => 120,
        :max_time => 240,
        :description => "King Robert Baratheon is dead, and the lands of Westeros brace for battle.

In the second edition of A Game of Thrones: The Board Game, three to six players take on the roles of the great Houses of the Seven Kingdoms of Westeros, as they vie for control of the Iron Throne through the use of diplomacy and warfare. Based on the best-selling A Song of Ice and Fire series of fantasy novels by George R.R. Martin, A Game of Thrones is an epic board game in which it will take more than military might to win. Will you take power through force, use honeyed words to coerce your way onto the throne, or rally the townsfolk to your side? Through Strategic Planning, masterful diplomacy, and clever card play, spread your influence over Westeros!

To begin the game, each player receives an army of Footman, Knight, Siege Engine, and Ship units, as well as a set of Order tokens and other necessary components. Each player also receives a deck of unique House Cards, which are used as leaders in battles against rival Houses.

Each round in the game is made up of three phases: the Westeros Phase, the Planning Phase, and the Action Phase. The Westeros Phase represents special events and day-to-day activities in Westeros. There are three different Westeros Decks, and each denotes a different global action, potentially affecting all players.

The Planning Phase is perhaps the most important. Here you secretly assign orders to all of your units by placing one order token face down on each area you control that contains at least one unit (Knight, Footman, Ship, or Siege Engine). This portion of the game emphasizes diplomacy and deduction. Can you trust the alliance that you made? Will you betray your ally and march upon him? Players may make promises to each other (for aid or peace, for example), but these promises are never binding. The result is tense and compelling negotiations, often ending in backstabbing worthy of Westeros!

During the Action Phase, the orders are resolved and battle is entered! When armies meet in combat, they secretly choose one of their House cards to add strength to the battle. Finally, the Houses can consolidate their power in the areas they control and use that power in future turns to influence their position in the court of the Iron Throne and to stand against the wildling Hordes.

In addition to featuring updated graphics and a clarified ruleset, this second edition of A Game of Thrones includes elements from the A Clash of Kings and A Storm of Swords expansions, including ports, garrisons, Wildling cards, and Siege engines, while introducing welcome new innovations like player screens and Tides of Battle cards.

Tides of Battle cards are an optional mechanism that brings an element of unpredictability to combat, representing erratic shifts in the momentum of war due to factors such as weather, morale, and tactical opportunity. During each combat, both players draw one Tides of Battle card from a communal deck, and its value modifies the strength of his chosen House card. What's more, such a card may also contain icons that can affect the outcome of the battle...all of which delivers a new level of intensity to your military engagements."
    },
    {
        :id => 18,
        :name => 'Munchkin',
        :ranking => 2298,
        :min_player => 3,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/1927/munchkin',
        :min_time => 90,
        :max_time => nil,
        :description => "Munchkin is a satirical card game based on the cliches and oddities of Dungeons and Dragons and other role-playing games. Each player starts at level 1 and the winner is the first player to reach level 10. Players can acquire familiar D&D style character classes during the game which determine to some extent the cards they can play.

There are two types of cards - treasure and encounters. Each turn the current players 'kicks down the door' - drawing an encounter card from the deck. Usually this will involve battling a monster. Monsters have their own levels and players must try and overcome it using the levels, weapons and powers they have acquired during the game or run away. Other players can chose to help the player or hinder by adding extra monsters to the encounter. Defeating a monster will usually result in drawing treasure cards and acquiring levels. Being defeated by a monster results in \"bad stuff\" which usually involves losing levels and treasure."
    },
    {
        :id => 19,
        :name => 'Scotland Yard',
        :ranking => 867,
        :min_player => 3,
        :max_player => 6,
        :link => 'https://boardgamegeek.com/boardgame/438/scotland-yard',
        :min_time => 45,
        :max_time => nil,
        :description => "In Scotland Yard, one of the players takes on the role of Mr. X. His job is to move from point to point around the map of London taking taxis, buses or subways. The detectives - that is, the remaining players acting in concert - move around similarly in an effort to move into the same space as Mr. X. But while the criminal's mode of transportation is nearly always known, his exact location is only known intermittently throughout the game."
    },
    {
        :id => 20,
        :name => 'Shadow Hunters',
        :ranking => 510,
        :min_player => 4,
        :max_player => 8,
        :link => 'https://boardgamegeek.com/boardgame/24068/shadow-hunters',
        :min_time => 45,
        :max_time => nil,
        :description => "Shadow Hunters is a survival board game set in a devil-filled forest in which three groups of characters-the Shadows, creatures of the night; the Hunters, humans who try to destroy supernatural creatures; and the Neutrals, civilians caught in the middle of this ancient battle-struggle against each other to survive.

You belong to one of these groups and must conceal your identity from others since you don't know whom you can trust-at least not initially. Over time, though, someone might decipher who you are through your actions or through Hermit cards, or you might even reveal yourself to use your special ability.

The key to victory is to identify your allies and enemies early because once your identity is revealed, your enemies will attack with impunity using their special abilities like Demolish, Teleport, and Suck Blood or their equipment cards such as the Rusty Broad Ax or Fortune Brooch. This ancient battle comes to a head and only one group will stand victorious-or a civilian, in the right circumstances, might claim victory."
    },
    #{
    #    :id => ,
    #    :name => '',
    #    :ranking => ,
    #    :min_player => ,
    #    :max_player => ,
    #    :link => '',
    #    :min_time => ,
    #    :max_time => ,
    #    :description => ""
    #},
]
