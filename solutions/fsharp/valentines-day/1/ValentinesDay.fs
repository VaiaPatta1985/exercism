module ValentinesDay

type Approval =
    | Yes
    | No
    | Maybe

type Cuisine =
    | Korean
    | Turkish

type Genre =
    | Crime
    | Horror
    | Romance
    | Thriller

type Activity =
    | BoardGame
    | Chill
    | Movie of Genre
    | Restaurant of Cuisine
    | Walk of int

let rateActivity (activity: Activity): Approval = 
    match activity with
    | BoardGame -> No
    | Chill -> No
    | Movie m -> match m with
                 | Romance -> Yes
                 | Crime -> No
                 | Horror -> No
                 | Thriller -> No
    | Restaurant r -> match r with
                      | Korean -> Yes
                      | Turkish -> Maybe
    | Walk w -> if w < 3 then Yes
                elif w < 5 then Maybe
                else No
