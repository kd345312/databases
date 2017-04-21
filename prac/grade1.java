import java.sql.*; 
import java.io.*; 

class grade1 { 

  void print_menu() {
    System.out.println("      PARAGON PROGRAM\n");
    System.out.println("(1) Add Player");
    System.out.println("(2) Add Hero");
    System.out.println("(3) Add Game Played");
    System.out.println("(4) Add Winner Result");
    System.out.println("(5) Add Loser Result");
      System.out.println("(6) Print Heros");
      System.out.println("(7) Delete Hero");
      System.out.println("(8) Update Hero Ability");
    System.out.println("(q) Quit\n");
  }

  void add_player(Connection conn)
    throws SQLException, IOException {
         
    Statement stmt = conn.createStatement(); 

    String gamertag   = readEntry("GamerTag: ");
    String kills = readEntry("kills: ");
        String deaths = readEntry("deaths: ");
        String wins = readEntry("Wins: ");
        String losses = readEntry("Losses: ");
        String favHero = readEntry("Favorite Hero: ");
    String query = "insert into PlayerStats values (" +
            "'" + gamertag + "', '" + kills + "', '" + deaths + "', '" + wins + "', '" +
        losses + "', '" +  favHero + "')";
    try {
      int nrows = stmt.executeUpdate(query);
    } catch (SQLException e) {
        System.out.println("Error Adding Player");
        while (e != null) {
          System.out.println("Message     : " + e.getMessage());
          e = e.getNextException();
        }
        return;
      }
    stmt.close();
    System.out.println("Player added");
  }

  void add_hero(Connection conn)
        throws SQLException, IOException {

    String name = readEntry("Name: ");
    String basic      = readEntry("Basic Damage: ");
    String ability    = readEntry("Ability Damage: ");
    String durability      = readEntry("Durability: ");
    String mobility      = readEntry("Mobility: ");
    String type      = readEntry("Type: ");

    String query = "insert into heros values (" +
            "'" + name + "', '" + basic + "', '" +
            ability + "', '" + durability + "', '" +
            mobility + "', '" + type + "')";
           
    Statement stmt = conn.createStatement (); 
    try {
      stmt.executeUpdate(query);
    } catch (SQLException e) {
      System.out.println("Hero was not added! Failure!");
      return;
    }
    System.out.println("Hero was added! Success!");
    stmt.close();
  }

  void add_game(Connection conn)
    throws SQLException, IOException {
        
        String gameId = readEntry("GameID: ");
        String home      = readEntry("Home gamer: ");
        String away    = readEntry("Away gamer: ");
        String homeHero      = readEntry("Home Hero: ");
        String awayHero      = readEntry("Away Hero: ");
        String winner      = readEntry("Winner: ");
        
        String query = "insert into Games values (" +
        "'" + gameId + "', '" + home + "', '" +
        away + "', '" + homeHero + "', '" +
        awayHero + "', '" + winner + "')";
        
        Statement stmt = conn.createStatement ();
        try {
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Game was not added! Failure!");
            return;
        }
        System.out.println("Game was added! Success!");
        stmt.close();
    }
    
    void add_winner(Connection conn)
    throws SQLException, IOException {
        
        String gameId = readEntry("GameID: ");
        String winnerName      = readEntry("Winner Name: ");
        String kills    = readEntry("Kills: ");
        String deaths      = readEntry("Deaths: ");
        String structsDestroyed      = readEntry("Structures Destroyed: ");
        
        String query = "insert into Winner values (" +
        "'" + gameId + "', '" + winnerName + "', '" +
        kills + "', '" + deaths + "', '" +
        structsDestroyed + "')";
        
        Statement stmt = conn.createStatement ();
        try {
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Winner was not added! Failure!");
            return;
        }
        System.out.println("Winner was added! Success!");
        stmt.close();
    }
    
    void add_loser(Connection conn)
    throws SQLException, IOException {
        
        String gameId = readEntry("GameID: ");
        String loserName      = readEntry("Loser Name: ");
        String kills    = readEntry("Kills: ");
        String deaths      = readEntry("Deaths: ");
        String structsDestroyed      = readEntry("Structures Destroyed: ");
        
        String query = "insert into Loser values (" +
        "'" + gameId + "', '" + loserName + "', '" +
        kills + "', '" + deaths + "', '" +
        structsDestroyed + "')";
        
        Statement stmt = conn.createStatement ();
        try {
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Loser was not added! Failure!");
            return;
        }
        System.out.println("Loser was added! Success!");
        stmt.close();
    }
    void print_heros(Connection conn)
    throws SQLException, IOException {
        String query = "select distinct name, basic, ability, durability, mobility, type " +
                        "from Heros";
        Statement stmt = conn.createStatement ();
        ResultSet rset = stmt.executeQuery(query);
        System.out.println("");
        while (rset.next ()) {
            System.out.println(rset.getString(1) + "   " +
                               rset.getString(2) + "   " +
                               rset.getString(3) + "   " +
                               rset.getString(4) + "   " +
                               rset.getString(5) + "   " +
                               rset.getString(6));
        }
        System.out.println("");
    }
    
    void delete_hero(Connection conn)
    throws SQLException, IOException {
        String delName = readEntry("Select Hero name to delete: ");
        String delStatement = "delete from Heros where name = '" + delName + "'";
        conn.setAutoCommit(false);
        Statement stmt = conn.createStatement ();
        int nrows = 0;
        try {
            nrows = stmt.executeUpdate(delStatement);
        } catch (SQLException e) {
            System.out.println("Could not delete hero");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.rollback();
            return;
        }
        System.out.println("Hero deleted");
        conn.commit();
        conn.setAutoCommit(true);
        stmt.close();
    }
    
    void modify_ability(Connection conn)
    throws SQLException, IOException{
        String heroname = readEntry("Enter name for ability modification: ");
        String newBasic = readEntry("Enter new basic power: ");
        String newablitity = readEntry("Enter new ability power: ");
        String newDurability = readEntry("Enter new Durability: ");
        String newMobility = readEntry("Enter new Mobility speed: ");
        String newType = readEntry("Enter new type: ");
        String query = "update Heros set basic = '" + newBasic +
                        "', ability = '" + newablitity +
                        "', durability = '" + newDurability +
                        "', mobility = '" + newMobility +
                        "', type = '" + newType +
                        "' where name = '" + heroname + "'";
        Statement stmt = conn.createStatement ();
        int nrows = 0;
        try {
            nrows = stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Could not update hero");
            while (e != null) {
                System.out.println("Message     : " + e.getMessage());
                e = e.getNextException();
            }
            conn.rollback();
            return;
        }
        System.out.println("Hero updated");
        conn.commit();
        conn.setAutoCommit(true);
        stmt.close();
    }


  //readEntry function -- to read input string
  static String readEntry(String prompt) {
     try {
       StringBuffer buffer = new StringBuffer();
       System.out.print(prompt);
       System.out.flush();
       int c = System.in.read();
       while(c != '\n' && c != -1) {
         buffer.append((char)c);
         c = System.in.read();
       }
       return buffer.toString().trim();
     } catch (IOException e) {
       return "";
       }
   }
} 
