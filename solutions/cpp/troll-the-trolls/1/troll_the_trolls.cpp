namespace hellmath {
    enum AccountStatus{
        troll,
        guest,
        user,
        mod,
    };
    enum Action{
        read,
        write,
        remove,
    };
    bool display_post(AccountStatus poster, AccountStatus viewer){
        return poster!=AccountStatus::troll||viewer==AccountStatus::troll;
    }
    bool permission_check(Action attempted_action, AccountStatus initiator){
        if(attempted_action==Action::write)return initiator!=AccountStatus::guest;
        if(attempted_action==Action::remove)return initiator==AccountStatus::mod;
        return true;
    }
    bool valid_player_combination(AccountStatus player1, AccountStatus player2){
        if(player1==AccountStatus::guest||player2==AccountStatus::guest)return false;
        if(player1==player2)return true;
        return player1!=AccountStatus::troll&&player2!=AccountStatus::troll;
    }
    bool has_priority(AccountStatus they, AccountStatus over_them){
        return they>over_them;
    }
}  // namespace hellmath
