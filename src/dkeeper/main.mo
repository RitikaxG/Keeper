import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{
  //Creating a new datatype
  public type Note={
    title:Text;
    content:Text;
  };

  //Creating a new variable 
  stable var notes:List.List<Note> =List.nil<Note>(); //New list 
  
  public func createNote(titleText:Text,contentText:Text){

    let newNote:Note={
      title=titleText;
      content=contentText;
    };

    //Will be pre-pended contains item that we want to push and the list we want to push the item into
    notes:=List.push(newNote,notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes():async [Note] {
    return List.toArray(notes);
  };

  //Remove an item from the list
  public func removeNote(id:Nat){
    //take drop append
    let listFront=List.take(notes,id);
    let listBack=List.drop(notes,id+1);
    notes:=List.append(listFront,listBack);
    
  }
}
