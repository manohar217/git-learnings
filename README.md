# git-learnings
---------------------

Learning Git effectively involves understanding not only the basic commands but also how they fit into various scenarios. I'll provide scenario-based examples to help you learn how to use Git effectively with the below commands:

**Scenario 1: Core Git Commands**

1. Initialize a Git repository: 
(1.**git init** : When you're inside a directory that you've cloned from a Git repository, you don't need to run git init. Git already knows it's a repository because you've cloned it. You can start tracking and managing files right away.

However, if you're in a directory that isn't part of a Git repository, you have to tell Git to start tracking those files by running git init. It's like telling Git, "Hey, I want you to keep an eye on these files and their changes from now on.")
   ```bash
   git init
   ```

2. Clone an existing repository:

   ```bash
   git clone <repository_URL>
   ```

3. Add changes to the staging area:

   ```bash
   git add <file(s)>
   ```

4. Commit changes to the repository:

   ```bash
   git commit -m "Your commit message"
   ```

5. Check the status of your repository:

   ```bash
   git status
   ```

6. View the difference between the working directory and the staging area:

   ```bash
   git diff
   ```

7. Switch to a different branch:

   ```bash
   git checkout <branch_name>
   ```

8. Unstage changes (move from the staging area back to the working directory):

   ```bash
   git reset <file(s)>
   ```

9. View the commit history:

   ```bash
   git log
   ```

10. Show information about a specific commit:

    ```bash
    git show <commit_hash>
    ```

11. Create and manage tags:

    ```bash
    git tag -a <tag_name> -m "Tag message" <commit_hash>
    ```

12. Push changes to a remote repository:

    ```bash
    git push <remote_name> <branch_name>
    ```

13. Pull changes from a remote repository:

    ```bash
    git pull <remote_name> <branch_name>
    ```

**Scenario 2: Branching**

1. List existing branches:

   ```bash
   git branch
   ```

2. Create and switch to a new branch:

   ```bash
   git checkout -b <new_branch_name>
   ```

3. Merge changes from one branch into another:

   ```bash
   git merge <source_branch>
   ```

4. Rebase one branch onto another:

   ```bash
   git rebase <base_branch>
   ```

5. Set the upstream branch for a local branch:
   (The git branch --set-upstream-to command is used to set up a tracking relationship between a local branch and a remote branch. To use it, you typically specify the remote branch as the upstream, like this:)
   ```bash
   git branch --set-upstream-to=origin/<remote_branch> <local_branch>
   ```

6. Unset the upstream branch:

   ```bash
   git branch --unset-upstream <local_branch>
   ```

7. Cherry-pick a specific commit:

   ```bash
   git cherry-pick <commit_hash>
   ```

**Scenario 3: Merging**

- To merge changes from one branch into another, you can use `git merge` or `git rebase`, as demonstrated in Scenario 2.

**Scenario 4: Stashing**

1. Stash your changes:

   ```bash
   git stash
   ```

2. Apply the most recent stash:

   ```bash
   git stash pop
   ```

3. List all stashes:

   ```bash
   git stash list
   ```

4. Apply a specific stash:

   ```bash
   git stash apply stash@{<stash_number>}
   ```

5. Drop a specific stash:

   ```bash
   git stash drop stash@{<stash_number>}
   ```

**Scenario 5: Remotes**

1. List remote repositories:

   ```bash
   git remote -v
   ```

2. Add a new remote:

   ```bash
   git remote add <remote_name> <remote_URL>
   ```

3. Remove a remote:

   ```bash
   git remote remove <remote_name>
   ```

4. Fetch changes from a remote repository:

   ```bash
   git fetch <remote_name>
   ```

5. Pull changes from a remote repository:

   ```bash
   git pull <remote_name> <branch_name>
   ```

6. Push changes to a remote repository:

   ```bash
   git push <remote_name> <branch_name>
   ```

7. Clone a repository as a mirror:
   (The git clone --mirror command is used to create a "bare" mirror clone of a Git repository. A mirror clone contains all the objects and references from the source repository, including all branches, tags, and commits. It's typically used for specific purposes like maintaining an exact copy of a repository, including all its history, for backup, migration, or mirroring purposes)
   ```bash
   git clone --mirror <repository_URL>
   ```

**Scenario 6: Configuration**

- Manage Git configuration using the `git config` command. Configure user details, default behaviors, and more.

8. To set up and use custom pre-commit and post-commit hooks in a Git repository, you'll need to create scripts and configure the Git hooks directory. Here's a step-by-step guide:

1. **Create a Git Hooks Directory**:
   - Start by creating a `.git/hooks` directory in your Git repository. This directory will hold your custom hooks scripts. You only need to do this step if the directory doesn't already exist.

   ```bash
   mkdir -p .git/hooks
   ```

2. **Create a Pre-Commit Hook**:
   - In the `.git/hooks` directory, create a file named `pre-commit` (no file extension).
   - Add your pre-commit script to this file. The script should perform actions you want to run before committing, such as code linting or running tests. Here's an example of a simple pre-commit hook that checks for whitespace errors in staged files using a tool like `lint-staged`:

   ```bash
   #!/bin/sh
   lint-staged
   ```

   Make sure to make the script executable:

   ```bash
   chmod +x .git/hooks/pre-commit
   ```

3. **Create a Post-Commit Hook** (Optional):
   - If you want to create a post-commit hook to run actions after a commit, create a file named `post-commit` in the `.git/hooks` directory. The script should perform actions you want to run after a commit. Here's an example of a simple post-commit hook that sends a notification after each commit:

   ```bash
   #!/bin/sh
   echo "Commit complete! Sending notification..."
   # Add your notification logic here
   ```

   Make it executable:

   ```bash
   chmod +x .git/hooks/post-commit
   ```

4. **Test the Hooks**:
   - You can test your hooks by making a new commit. When you run `git commit`, the pre-commit hook will execute before the commit is finalized, and the post-commit hook (if you created one) will execute after the commit.

   ```bash
   git commit -m "Your commit message"
   ```

5. **Customize Hooks as Needed**:
   - You can further customize your hooks to perform specific actions, such as running tests, formatting code, or sending notifications.
   - Always ensure that your hooks return an exit status of 0 to allow the commit to proceed or a non-zero exit status to prevent the commit, based on the conditions you define in your scripts.

By setting up and using Git hooks in this way, you can automate processes and enforce best practices in your Git workflow. The example provided is a starting point, and you can expand it to suit the specific needs of your project.

6. **git blame**
   The git blame command in Git is used to display the author and revision information for each line of a file. It is a powerful tool for tracking changes to a file and identifying who made each change. The output of git blame shows the commit hash, author, date, and the specific line that was last modified for each line of the file.
  ```bash
   git blame <file>

   ```
7. **git fetch**
   The git fetch command in Git is used to update your local repository with changes from a remote repository. However, unlike git pull, it doesn't automatically merge the changes into your current branch. Instead, it retrieves the changes from the remote repository and stores them in your local repository, allowing you to review the changes before merging them.
   ```bash
   git fetch origin
   ```

8.**git Alias**
   he git config --global alias command is used to create custom aliases for Git commands. Aliases allow you to define shortcuts for longer or frequently used Git commands, making your Git workflow more efficient. With aliases, you can use shorter and more memorable names for common operations.
   ```bash
   git config --global alias.<alias> <command>

   ```

   ```bash
   git config --global alias.st status
   ```
