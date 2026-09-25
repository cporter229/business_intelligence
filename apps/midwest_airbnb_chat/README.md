# ISA 401 Airbnb Chat

**Ask a question in plain English, get the SQL and a table back**

A multi line [querychat](https://github.com/posit-dev/querychat) app built in ISA 401 (Miami University) on the airbnb listings that [ChatISA](https://chatisa.fsb.miamioh.edu) airbnb collected. It is the completed caht fot Assignment 05, where you rebuild it on the Airbnb data, deploy it to [Render](https://render.com) from your GitHub repository, and then improve it.

**Live app:** https://midwest-airbnb-chat-n82s.onrender.com/

---

## What is this app?

The app connects to a SQLite database hands the `listings` table to querychat, and lets an LLM translate your question into SQL. Every answer shows the query it ran, so you can check the logic and reuse the SQL yourself.

**Example queries:**
### 1.What area's of Chicago are the least expensive?
### 2.Show me the priciest homes.
### 3.How many listings can host 8 people? 

**Screenshots**
![Answer to question 1](images/question1.png)
![Answer to question 2](images/question2.png)
![Answer to question 3](images/question3.png)
---
