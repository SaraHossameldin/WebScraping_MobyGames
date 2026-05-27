import mysql.connector
from datetime import datetime

def get_connection():
    db = mysql.connector.connect(
        host="mysql-22b6c183-aucegypt-b490.l.aivencloud.com", 
        port=26672,
        user="avnadmin", 
        password="you password here ", 
        database="videogame_db"
    )
    return db

# Test 1 Passed + date: year-month-day
def register_user():
    db = get_connection()
    cur = db.cursor()
    email = input("enter email: ")
    username = input("enter username: ")
    gender = input("enter gender: ")
    age = int(input("enter age: "))
    birthdate = input("enter birthdate: ")
    country = input("enter country: ")
    created_at = datetime.now()
    cur.execute("insert into app_user(email, username, gender, age, birthdate, country, created_at) values (%s, %s, %s, %s, %s, %s, %s)", (email, username, gender, age, birthdate, country, created_at))
    db.commit()
    db.close()


# Test 2 Passed 
def add_user_rating():
    db = get_connection()
    cur = db.cursor()
    username = input("enter your username: ")
    game_name = input("enter the game name: ")
    rating = float(input("enter the rating: "))
  
    
    cur.execute("select user_id from app_user where username = %s", (username,))
    user_result = cur.fetchall()
    if not user_result:
        print("user not found")
        db.close()
        return
    user_id = user_result[0][0]
    
    cur.execute("select game_id from game where name = %s", (game_name,))
    game_result = cur.fetchall()
    if not game_result:
        print("game not found")
        db.close()
        return
    game_id = game_result[0][0]
    
    cur.execute("insert into user_rating (user_id, game_id, rating) values (%s, %s, %s)", (user_id, game_id, rating))
    db.commit()
    db.close()

#Test 3: Passed 
def view_my_ratings():
    db = get_connection()
    cur = db.cursor()
    username = input("enter your username: ")
    cur.execute("select user_id from app_user where username = %s", (username,))
    user_result = cur.fetchall()
    if not user_result:
        print("user not found")
        db.close()
        return
    user_id = user_result[0][0]
    
    cur.execute("select g.name, ur.rating from user_rating ur join game g on ur.game_id = g.game_id where ur.user_id = %s", (user_id,))
    ratings = cur.fetchall()
    for rating in ratings:
        print("game:", rating[0])
        print("rating:", rating[1])
        print()
    db.close()


#Test 4: Passed 
def view_top_rated_critics_per_genre():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select g.name, year(g.release_date), gen.name, avg(cr.score), avg(pr.score) from game g inner join game_genre gg on g.game_id = gg.game_id inner join genre gen on gg.genre_id = gen.genre_id inner join critic_rating cr on g.game_id = cr.game_id inner join player_rating pr on g.game_id = pr.game_id group by g.game_id, year(g.release_date), gen.name order by year(g.release_date), gen.name, avg(cr.score) desc, avg(pr.score) desc limit 10")
    top_games = cur.fetchall()
    for game in top_games:
        print("game:", game[0])
        print("year:", game[1])
        print("genre:", game[2])
        print("critic score:", game[3])
        print("player score:", game[4])
        print()
    db.close()

# Test 5: Passed
def list_games_per_category():
    db = get_connection()
    cur = db.cursor()
    print("search by: 1. genre 2. developer 3. platform 4. publisher")
    choice = input("enter choice: ")
        
    if choice == "1":
        genre = input("enter genre name: ")
        cur.execute("select g.name, g.release_date, g.moby_score from game g join game_genre gg on g.game_id = gg.game_id join genre gen on gg.genre_id = gen.genre_id where gen.name = %s order by g.moby_score desc", (genre,))
    elif choice == "2":
        developer = input("enter developer name: ")
        cur.execute("select g.name, g.release_date, g.moby_score from game g join game_developer gd on g.game_id = gd.game_id join developer d on gd.developer_id = d.developer_id where d.name = %s order by g.moby_score desc", (developer,))
    elif choice == "3":
        platform = input("enter platform name: ")
        cur.execute("select g.name, g.release_date, g.moby_score from game g join game_platform gp on g.game_id = gp.game_id join platform p on gp.platform_id = p.platform_id where p.name = %s order by g.moby_score desc", (platform,))
    elif choice == "4":
        publisher = input("enter publisher name: ")
        cur.execute("select g.name, g.release_date, g.moby_score from game g join game_publisher gpub on g.game_id = gpub.game_id join publisher pub on gpub.publisher_id = pub.publisher_id where pub.name = %s order by g.moby_score desc", (publisher,))
    else:
        print("invalid choice")
        db.close()
        return
            
    games = cur.fetchall()
    for game in games:
        print("game:", game[0])
        print("release:", game[1])
        print("moby score:", game[2])
        print()
    db.close()


# Test 6 Passed
def list_top_genre_setting_game():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select g.name, gen.name, s.name, g.moby_score from game g inner join game_genre gg on g.game_id = gg.game_id inner join genre gen on gg.genre_id = gen.genre_id inner join game_setting gs on g.game_id = gs.game_id inner join setting s on gs.setting_id = s.setting_id order by gen.name, s.name, g.moby_score desc")
    games = cur.fetchall()
    grouped = {}
    for game in games:
        key = (game[1], game[2])
        if key not in grouped:
            grouped[key] = []
        grouped[key].append(game)
 
    for (genre, setting), game_list in grouped.items():
        print(genre, "  ", setting)
        for i, game in enumerate(game_list[:5]):
            print(i+1, game[0], " score:", game[3])
        print()
    db.close()


# Test 7 Passed
def list_top_critic_genre_game():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select d.name, gen.name, avg(cr.score), count(g.game_id) from developer d inner join game_developer gd on d.developer_id = gd.developer_id join game g on gd.game_id = g.game_id join game_genre gg on g.game_id = gg.game_id join genre gen on gg.genre_id = gen.genre_id join critic_rating cr on g.game_id = cr.game_id group by d.developer_id, gen.genre_id having count(g.game_id) >= 1 order by gen.name, avg(cr.score) desc")
    results = cur.fetchall()
    grouped = {}
    for result in results:
        genre = result[1]
        if genre not in grouped:
            grouped[genre] = []
        grouped[genre].append(result)
        
    for genre, dev_list in grouped.items():
        print(genre)
        for i, dev in enumerate(dev_list[:5]):
            print(i+1, dev[0], " average score is:", dev[2])
        print()
    db.close()

# Test 8 Passed
def perfect_game():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select g.game_id, g.name, pr.score from game g join player_rating pr on g.game_id = pr.game_id order by pr.score desc limit 1")
    best_game_result = cur.fetchall()
    if not best_game_result:
        print("no games found")
        db.close()
        return
    game_id, game_name, score = best_game_result[0]

    cur.execute("select distinct s.name from game_setting gs inner join setting s on gs.setting_id = s.setting_id where gs.game_id = %s", (game_id,))
    settings_result = cur.fetchall()
    settings = [row[0] for row in settings_result]
        
    cur.execute("select distinct gen.name from game_genre gg inner join genre gen on gg.genre_id = gen.genre_id where gg.game_id = %s", (game_id,))
    genres_result = cur.fetchall()
    genres = [row[0] for row in genres_result]
        
    cur.execute("select distinct p.name from game_publisher gp inner join publisher p on gp.publisher_id = p.publisher_id where gp.game_id = %s", (game_id,))
    publishers_result = cur.fetchall()
    publishers = [row[0] for row in publishers_result]
        
    cur.execute("select distinct d.name from game_developer gd inner join developer d on gd.developer_id = d.developer_id where gd.game_id = %s", (game_id,))
    developers_result = cur.fetchall()
    developers = [row[0] for row in developers_result]
        
    print("game:", game_name, "score:", score)
    print("genres:", ", ".join(genres))
    print("settings:", ", ".join(settings))
    print("publishers:", ", ".join(publishers))
    print("developers:", ", ".join(developers))
    db.close()


#Test 9 Passed 
def developers_bases_volume():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select d.name, count(gd.game_id) from developer d inner join game_developer gd on d.developer_id = gd.developer_id group by d.developer_id order by count(gd.game_id) desc limit 5")
    developers = cur.fetchall()
    for i, dev in enumerate(developers, 1):
        print(i, dev[0], "developed games:", dev[1])
    db.close()


#Test 10 Passed 
def top_5_collaborations():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select dir.name, dev.name, count(distinct gd.game_id) from director dir inner join game_director gdir on dir.director_id = gdir.director_id join game_developer gd on gdir.game_id = gd.game_id inner join developer dev on gd.developer_id = dev.developer_id group by dir.director_id, dev.developer_id order by count(distinct gd.game_id) desc limit 5")
    collaborations = cur.fetchall()
    for i, collab in enumerate(collaborations, 1):
        print(i, collab[0], "&", collab[1], " Number iof collaborations:", collab[2])
    db.close()

#Test 11 Passed 
def avalble_games():
    db = get_connection()
    cur = db.cursor()
    cur.execute("select p.name, count(distinct gp.game_id), avg(cr.score), avg(pr.score) from platform p inner join game_platform gp on p.platform_id = gp.platform_id inner join game g on gp.game_id = g.game_id inner join critic_rating cr on g.game_id = cr.game_id inner join player_rating pr on g.game_id = pr.game_id group by p.platform_id order by count(distinct gp.game_id) desc")
    platforms = cur.fetchall()
    for platform in platforms:
        print("platform:", platform[0])
        print("games:", platform[1])
        print("averageg critic:", platform[2])
        print("averageg player:", platform[3])
        print()
    db.close()



def main():
    while True:
        print("1. register a user")
        print("2. add a new user rating for an existing video games")
        print("3. view existing ratings for the user")
        print("4. top rated games by critics/players in each year/genre")
        print("5. all games per developer/platform/publisher/genre")
        print("6. top 5 video games in each genre/setting by moby_score")
        print("7. top 5 developers by critics in each genre")
        print("8. perfect game")
        print("9. top 5 developers based on volume of games")
        print("10. top 5 collaborators from directors and developers")
        print("11. number of games available on each platform")
        print("0. exit")
        choice = input("choice: ")

        if choice == "1":
            register_user()
        elif choice == "2":
            add_user_rating()
        elif choice == "3":
            view_my_ratings()
        elif choice == "4":
            view_top_rated_critics_per_genre()
        elif choice == "5":
            list_games_per_category()
        elif choice == "6":
            list_top_genre_setting_game()
        elif choice == "7":
            list_top_critic_genre_game()
        elif choice == "8":
            perfect_game()
        elif choice == "9":
            developers_bases_volume()
        elif choice == "10":
            top_5_collaborations()
        elif choice == "11":
            avalble_games()
        elif choice == "0":
            print("goodbye!")
            break
        else:
            print("invalid option!")

if __name__ == "__main__":
    main()
