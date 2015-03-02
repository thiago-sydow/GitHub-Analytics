GitHub-Analytics
================

[![endorse](https://api.coderwall.com/stephenott/endorsecount.png)](https://coderwall.com/stephenott)

Dec 10, 2013: Check out https://github.com/StephenOTT/GitHub-Time-Tracking for Time Tracking with GitHub Issue Tracker, Milestones, and Code Commits

Dec 1, 2013: Make sure to add the following commit/code to Sewyer gem for proper JSON response. This is needed because of the way that GitHub Octokit.rb 2.x returns its responses as `Sewyer::Reponses`  --https://github.com/lostisland/sawyer/pull/15

**I welcome any and all feedback!!! Please post a issue, question or pull request!!**

Downloads issues their comments from GitHub repositories into a mongodb database.

Analytics are then run on the issues and comments in the mongodb database.

Primary use at this point is project management based analytics that are not currently available on GitHub.com


## How to run the Web App:

1. Register/Create a Application at https://github.com/settings/applications/new.  Set your fields to the following:

	1.1. Homepage URL: `http://localhost:9292`

	1.2. Authorization callback URL: `http://localhost:9292/auth/github/callback`

	1.3. Application Name: `GitHub-Analytics` or whatever you want to call your application.

2. Install MongoDB (typically: `brew update`, followed by: `brew install mongodb`)

3. `cd` into the `app` folder and run the following commands in the `app` folder:

	3.1. Run `mongod` in terminal

	3.2. Open a second terminal window and run: `bundle install`

	3.3.`MONGODB_URL="localhost" MONGODB_PORT="27017" GITHUB_CLIENT_ID="CLIENT_ID"  GITHUB_CLIENT_SECRET="CLIENT_SECRET" ORGANIZATION="YOUR_ORGANIZATION" bundle exec rackup`
	Get the Client ID and Client Secret from the settings of your created/registered GitHub Application in Step 1.

Obs:

1. If you are using an external MongoDB service, instead of set MONGODB_URL and MONGODB_PORT,
you can set only MONGODB_URI using the URI from your service.

2. The ORGANIZATION variable is optional, and if set it will restrict the access only to users that are part of the given Organization.


	Go to `http://localhost:9292`

## Presentations:

Github Analytics: Ruby Ottawa Meetup (http://bit.ly/1cVFe9s)



##Screenshots:
![screen shot 2014-04-19 at 2 06 35 am](https://cloud.githubusercontent.com/assets/1994838/2747795/e1c498a4-c788-11e3-874d-29a6c54dae9f.png)


-----


![screen shot 2014-04-20 at 4 08 23 pm](https://cloud.githubusercontent.com/assets/1994838/2751355/a3b7bc9a-c8c7-11e3-8430-a2c065a2c98f.png)


##Process Overview:
![github-analytics process overview](https://f.cloud.github.com/assets/1994838/1708517/a88ca764-610f-11e3-8d0a-48500edb0d83.png)


-

## Actionable Reporting and Analysis

1. Issues Assigned to each user with size/complexity of issue identified: See Sprint.ly for great example: https://github.com/StephenOTT/GitHub-Analytics/issues/1#issuecomment-30169941

 1.1. Group issues assigned to each user across multiple repositories

2. Time Reporting.

3. using the emoji ```:alarm_clock:``` plus a DateTime format such as Feb 2, 2013 3pm or any sort of combination a email notification would be created to notify the user as a reminder.  Could be used about tasks, due dates, milestones, label changes, etc.

4. Using the ```:clock1:``` or any version of the clock emoji to provide time tracking.  Example would be `:clock1: 2h`.  This would signify 2h of work spend on the issue done by the following user.  Adding additional features like: `:clock: 2h Sept 22, 2014` or other variations would provide time details time tracking down to dates, time of day etc.

 4.1. Using the Clock Emoji we can extend the details that can posted.  Example you could include categorization information, comments, descriptions, followups, etc.

5. Labels Assignment across multiple Repositories.

6. History of Label Assignment per issue.

 6.1. Using the history of label assignment per issue, you can use labels such as "25% Complete", "50% Complete", "75% Complete", etc to show a history of a specific issues timeline from start to completion in terms of perceived % completed.  This helps with post-launch reviews, and with analysis of problematic issues.

7. History of Issues within a Milestone

 7.1. History of percentage complete of a Milestone

8. Break down of GFM Task Lists per users and aggregate per repo and across multiple repos

9. History of Issue Assignment per issue.




## Types of Analysis:

1. Issues Closed (Count) per user.
2. Total comments made per user.
3. Breakdown of comments made referencing other users per user
	- example: Number of times a user references other users (breakdown of each user (histogram).
4. Issues per milestone.
5. Duration of issues open.
6. Avg time issues open/Time is takes to close.
7. Character count per post: avg per user, per issue, etc.
8. Issues opened and closed per min, hour, day, week, month, quarter, year.
9. Issues being watched
10. Most popular issues (most watched, most commented, etc)
11. Issues assigned to users
12. Counts of issues that are assigned to users and closed by the same user
13. Number of times issues are opened and closed repeatedly.
14. Sentiment analysis of issues and comments for that issue
	- Breakdown of sentiment per user and types of issues
	- Analysis of Issue Titles: Looking to have better descriptive titles.
15. Labels analysis
16. Assignment changes of issues: Visual of issue assignment changes per user and timeframe
17. Printable table breakdown of issues assigned to each user
18. Printable table breakdown of weekly activity metrics of specific users: HIGHLY used by old school PMs that staff often report to.
19. Milestone changes (Event Analysis) - Changes of milestone
20. Analysis of URLs being used in issues and comments (popular url mentions, number of github issues uploads etc)
21. Analysis of number of comments per issues before they are closed.
22. Analysis of Popular labels (has cloud implications if analysis becomes a service you could analyze popular labels across repos as well as their usage.
23. Comment Streaks and Issue Creation/Close streaks
	- Comments Streak: Number of times a user makes multiple comments one after another in a single issue.
24. Emoticon usage: PMs could say to use specific emoticons when they want to support something like "+1", and this can be tallied.
25. Task counts and usage analysis.
26. Events Analysis: Modification of Issues and Comments
	- Users that make the most modifications to Issues and Comments
	- Users that make the most modifications to their own posts vs others posts
	- Weekly breakdown of modifications made
	- Timeframe breakdown of modifications made when and by who.
27. Deleted comments: when, by who, whos posts, their own posts? etc.
28. Pintrest style breakdown of images in comments with links back to comments/issues and context for specific image.
29. Cross-Issue reference usage.  Most referenced Issues. Timeframe breakdown
30. Pie charts of issues and label assignment
31. Analysis of issues with more than one label
32. Analysis of Events and Label assignment
33. Change in milestone due dates
34. Change in milestone number of issues and %completed over time (line graph (%completed and time/dates)
35. Analysis of users on which teams: duration, added, removed dates, etc.
36. Breakdown of Repo Activity at high level: starts, forks, issues opened, closed, commits, etc.  Exec style printable report that provides a high level overview for review when in high level meetings.
37. Pull Requests: when, by who, refs of other issues, comments made, duration open, amount of code etc.
38. Creation of new repos
39. deletion of repos
40. Repos analysis: languages, teams, branches, tags, deletions of repos, contributors, etc.  Meant to be high level for reporting.
41. bar graph is issue activity (number of posts broken down by time)
42. Add special characters to GitHub post + time value to do time tracking within issues.  Github GFM text does not show all text.
43. Track Thanks yous.  Tracking when a user submits a pull request or issue and people thank you for submitting.  See if that person is more likely to submit another issue/pull request (because people thanked them they are more likely to submit more requests/issues in the future).

44. Use new BETA feature of MongoDB for Text Analysis/Text Search for providing Time Tracking feature.  Use invisible text in issues (html comments) to provide time tracking capability

45. View issues from multiple repositories with labels and milestones to provide PMs with high level overview of priority issues
46. Most Referenced Issues
47. Most Referenced Users
48. Most Referenced Repos
49. Compare Followers of 2 or more users.  See which followers they have in common.
50. Compare Stared Repos of 2 or more users: The Repos the users have Stared.  See which Repos they users have in common.


##Events Analysis:

1. hourly or daily download of events
2. types of events most popular, per user, etc.
3. Label Assignment
4. Milestone assignment



## Image Samples:

![screen shot 2013-09-24 at 1 42 01 am](https://f.cloud.github.com/assets/1994838/1197485/553afd28-24dc-11e3-9d84-9c7b32bbe69b.png)

--

![screen shot 2013-09-24 at 1 34 07 am](https://f.cloud.github.com/assets/1994838/1197486/5559f91c-24dc-11e3-9792-0c884526fd60.png)

--

Printable Issue queues for PMs with spikelines shows activity:
![screen shot 2013-10-17 at 2 04 24 pm](https://f.cloud.github.com/assets/1994838/1354563/d020bd84-3756-11e3-856b-34e29e3339c1.png)

--

Issues Count Assigned to specific users + unassigned count:
![screen shot 2013-10-18 at 12 14 54 am](https://f.cloud.github.com/assets/1994838/1358033/0ecc7f12-37ae-11e3-9d14-1a6f369d047d.png)

--

Issue Events Timeline (This is all issue events for all issues grouped together)
![screen shot 2013-10-19 at 2 04 15 am](https://f.cloud.github.com/assets/1994838/1365705/7af5e936-3884-11e3-85ae-0d404bc5c496.png)

--

Pie chart of Issue Event Types - All Issue events for all issues
![screen shot 2013-10-19 at 2 08 05 am](https://f.cloud.github.com/assets/1994838/1365706/0cf044da-3885-11e3-842b-f68cbcc1b5b6.png)



## To Do:

- [x] Downloading of Repo Events into Mongodb
- [x] Convert to Sinatra app
- [x] Downloading of Team data
- [x] Turn Github DateTime string into recognized Mongodb dateTime.  Currently github datetime string is not properly recognized by Mongodb.
- [x] refactor method usage of Date conversions
- [x] refactor analyze methods names and structure
- [x] refactor methods into multifile MVC part of sinatra conversion
- [ ] Build Dashboard that is equiv of the Github Survivor app (https://github.com/99designs/githubsurvivor)
- [ ] PRIORITY: Develop Temp glue code for proper timezone query and output.  Because of Mongos lack of timeline support at the query level for the Aggregation framework.
- [ ] Refactor code to follow worker/job model to support sidekiq for calling jobs.  Current issue is mainly based in the calling of issues, issue comments, and issue events.  Each of these three can easily tax out the GitHub API hourly rate limit for the specific user.  This mainly occurs for large projects such as WET-BOEW/WET-BOEW.
- [x] Refactor code for more ruby like Naming conventions and integration of methods and classes.



## Data structure Overview (Out of Date):
---
https://github.com/StephenOTT/GitHub-Analytics/issues/1#issuecomment-29685800



## Issues API Issues:

1. Issue and Issue Comment **revisions** that are exposed through API.  No event or record is created when a revision occurs.
2. No event or record is created when an issue **comment is deleted**.
3. No event or record is created when an issue **label** is applied or removed.
4. No event or record is created when a **milestone** is applied or removed.
5. No event or record is created when a issue **Assignee** is un-assigned, and the issue has not assignee.
6. Issue Events do not have a payload in the API and therefore you must do another API call for details of the event.  Example: If a user is assigned a Issue Event is created but there is not details about which user was assigned.
7. No Repo details other than the API url are not part of the Issue Events API.
8. No event or record is created when a Label is created or deleted in a repo (this is the creation or deletion of a label for the entire repository).
9. No event or record is created when a repo is un-stared.  A Repo Event is created when a repo is Stared, but not when it is un-stared.
10. No event or record is created when a repo is Watched, ignored, or Not-Watching
11. Issue Events do not have a field that indicate the specific issue the event comes from.  Issue Events should have a "repo" object like Repository Events have that indicates the specific repo and issue number that the events come from.  (This issue has been resolved manually during the data download.  See the 'getIssueEventsAllIssue' Method).
12. Getting list of Repos for a Team contains a array called "permissions" that is just a T/F value list for the current authenticated user.  Proper returned values/expected values would be to return users for each of the T/F values showing which users have the specific permissions.

## Github Design Issues:

1. When you delete a Label from the master list it deletes all labels assigned to issues for that deleted label.  This is a problem for maintaining a "current" label list.  This means that if you ever get a legacy label you must keep it in the list forever or the old labels will lose their assigned labels.


## Other Possible uses for GitHub-Analytics Code

1. With some simple modifications for uploading to GitHub rather than just downloading from GitHub, a full GitHub "Backup your Repo" solution can be provided.  Backup.co is currently providing a private beta for this.  This would be a easy solution to provide

2. ~~Time Tracking.  Using GFM and text searching on the DB side we can gather time tracking information~~  Added as part of GitHub-Time-Tracking Web App.

3. Network Analysis of GitHub Issues to show network graph of issue mentions and use mentions.  This can show dependencies within the project/issue tracker and show who is the most popular user to be mentioned for types of issues.  This would produce very interesting graphics for large projects.

4. Provide CSV, Excel, JSON, etc upload capability to GitHub Issue Tracker.  This would build off of number 1 above but would also provide the added benefit for groups to generate issues based on something like an Excel file. (Other projects have accomplished this already)

5. "Project Templates" - A series of issues, milestones, and labels that are created and applied in a repo for when a new project is started.  These would be customizable based on the company's/organization's specific project methodology and process.

6. Repo Comparisons - Allows you to select 2 or more Repos and be provided with comparative stats (issues, users, stars, languages, labels, activity, Git Stats, Keywords, Revision Activity, similar users, similar code, Gems/Libraries/etc used, similar dependencies

7. Have a ability to grab all of the users stats about their system when creating an issue in GitHub.  Stats like: Device, browser, resolution, browser version, OS, etc.
