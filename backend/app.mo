
import _Array "mo:base/Array";
import _Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Nat"mo:base/Nat";

actor StartShield {
    //Def. type
    type Role = {
        id: Nat;
        name: Text;
    };
    type User = {
        id:Principal;
        name:Text;
        role:Role;
    };
     // We store the greeting in a stable variable such that it gets persisted over canister upgrades.
    stable var greeting : Text = "Hello, ";

    // This update method stores the greeting prefix in stable memory.
    public func setGreeting(prefix : Text) : async () {
        greeting := prefix;
    };

    // This query method returns the currently persisted greeting with the given name.
    public query func greet(name : Text) : async Text {
        return greeting # name # "!";
    };
}

