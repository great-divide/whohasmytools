## WhoHasMyTools
A Sinatra-based app that allows Users to sign up, add Tools, and loan those tools to other Users.

### What you should know
The User to User relationship is defined as loaner to borrower, and created with a 
`has_many through: loaner_contracts and borrower_contracts association`. See the `User` and `Contract` models for details.

### Getting familiar
* Run `db:migrate` and `db:seed` to create two Users and one Tool. 
* Check the seed file for username/pass and log in as "user1".  
* Loan the drill to "user2"
* Click on stuff and play around
* Log in as "user2" to view things from the "borrower" perspective

### Notes
Right now, the rights to loan and return a Tool lie exclusively with the Loaner. That is, a Loaner can say that their Tool has been
loaned, and a Loaner can say that the Tool has been returned. In some ways this makes sense. It puts responsibility for tracking down
one's tools on the shoulders of the Loaner, who is, in theory, the more concerned of the two parties anyway. The whole app is designed
to solve the problem from a Loaner's pov.

However, an argument can also be made that the Borrower should be able to initiate a Contract and also show that a tool has been returned.
Perhaps the best solution is one where only Loaners can create the Contracts, and the Contract is officially ended when **both** Loaner and
Borrower terminate the Contract.

### Future development
- In addition to addressing the notes above re: Borrower, a future version could also put in timed reminders, and send a message to both
parties at some determined interval (1 week, 2 weeks) to remind them who has their Tools, whose Tools they have.

- The My Tools section of the User dashboard could be altered to display Available Tools vs Loaned Tools (right now all Tools are displayed, regardless of loan status). This would be useful as a quick overview of the state of one's tool library. 

- The dropdown menu for selecting a tool should only display available Tools

- Right now, when a User creates a Loan, they must type in the Username of the Borrower... would probably be better as a pulldown menu of some kind, but a dropdown of all Users would be overwhelming, so another User association of "friends" might be necessary, and one can only lend to friends... but geez that sounds complicated. Maybe typing in the Username is best after all.
