## Write down the explanation in ex4 folder (like in a `README.md` file)

To be honest, ex4 was challenging for me because I typically work on projects independently, and I don't frequently use these commands.
I couldn't manage to fork the project on GitLab because I am only allowed to create new projects on my company's tenant.
So, I created a new repository on GitHub, but unfortunately, I don't have the commit history.

I completed the exercise locally without making any commits. Then, I committed the results to GitHub on the merged and rebased branch.

Here my answer for the question : Can you explain why you have a diff?
The reason we have a diff is that the two branches ('merged' and 'rebased') have different commit histories.
The 'merged' branch has a merge commit that combines the changes from 'stein' with the changes from 'queens'.
In contrast, the 'rebased' branch incorporates the changes from 'queens' by applying them on top of the 'stein' branch using rebase.
The differences in commit history, especially the merge commit in 'merged,' will result in a diff between the two branches when you compare them.