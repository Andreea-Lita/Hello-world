import Principal "mo:base/Principal";


actor AdminCanister {
  stable var users : [Principal] = [];
  let adminPrincipal : Principal = Principal.fromText("xxxx-yyyyy-zzzzz");

  public func addUser(newUser: Principal) : async Text {
    if (msg.caller == adminPrincipal) {
      users := Array.append(users, [newUser]);
      return "Utilizatorul a fost adăugat cu succes.";
    } else {
      return "Eroare: Doar administratorul poate adăuga utilizatori.";
    }
  }
}

j    return users; //listing users
}

public func removeUser(userToRemove: Principal) : async Text {
    if (msg.caller == adminPrincipal) {
        users := users.filter(func(user) { user != userToRemove });
        return "Utilizatorul a fost eliminat.";//deleteing users
    } else {
        return "Eroare: Doar administratorul poate elimina utilizatori.";
    }
}
