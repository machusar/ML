# Introduction to Git and GitHub

## Overview

This guide will walk you through setting up Git, creating repositories, and understanding the fundamental concepts of version control for your graduate-level coursework.

## Table of Contents

1. [Git Terminology](#git-terminology)
2. [Setting Up GitHub](#setting-up-github)
3. [Installing Git Tools](#installing-git-tools)
4. [Creating Your First Repository](#creating-your-first-repository)
5. [Basic Git Commands](#basic-git-commands)
6. [Working with Remote Repositories](#working-with-remote-repositories)
7. [Best Practices](#best-practices)

---

## Git Terminology

Before diving in, let's understand the key terms:

### Core Concepts

- **Repository (Repo)**: A folder/project tracked by Git, containing all your files and their complete history
- **Commit**: A snapshot of your project at a specific point in time
- **Branch**: A parallel version of your repository (main/master is the default branch)
- **Clone**: Creating a local copy of a remote repository
- **Fork**: Creating your own copy of someone else's repository on GitHub
- **Pull**: Downloading changes from a remote repository to your local machine
- **Push**: Uploading your local commits to a remote repository
- **Merge**: Combining changes from different branches
- **Pull Request (PR)**: A request to merge your changes into another branch/repository
- **Staging Area (Index)**: A preparation area for commits; files must be "staged" before committing
- **Working Directory**: The folder on your computer where you're actively working on files
- **Remote**: A version of your repository hosted on a server (like GitHub)
- **Origin**: The default name for the remote repository you cloned from
- **HEAD**: A pointer to your current branch/commit location

### Common Terms

- **Diff**: The differences between two versions of a file
- **.gitignore**: A file that tells Git which files/folders to ignore
- **Conflict**: When two changes clash and Git can't automatically merge them
- **Checkout**: Switch between different branches or restore files
- **Stash**: Temporarily save uncommitted changes

---

## Setting Up GitHub

### Step 1: Create a GitHub Account

1. Go to [github.com](https://github.com)
2. Click "Sign up" in the top right corner
3. Follow the prompts:
   - Enter your email address
   - Create a password
   - Choose a username (this will be public)
   - Verify your account
4. Choose the free plan (sufficient for most academic work)

### Step 2: Configure Your Profile

1. Add a profile picture (optional but recommended)
2. Add your academic affiliation
3. Consider adding a brief bio

### Step 3: Enable Two-Factor Authentication (Recommended)

1. Go to Settings > Password and authentication
2. Enable two-factor authentication for account security

---

## Installing Git Tools

You have two main options: **GitHub Desktop** (GUI) or **Git CLI** (Command Line). We'll cover both.

### Option 1: GitHub Desktop (Recommended for Beginners)

**Windows:**
1. Visit [desktop.github.com](https://desktop.github.com)
2. Click "Download for Windows"
3. Run the installer (GitHubDesktopSetup.exe)
4. Sign in with your GitHub account when prompted

**Mac:**
1. Visit [desktop.github.com](https://desktop.github.com)
2. Click "Download for macOS"
3. Open the .zip file and drag GitHub Desktop to Applications
4. Launch and sign in with your GitHub account

### Option 2: Git Command Line

**Windows:**
1. Download Git from [git-scm.com](https://git-scm.com)
2. Run the installer
3. Use recommended settings (default options are fine)
4. This installs Git Bash (a terminal for Git commands)

**Mac:**
Git is often pre-installed. Check by opening Terminal and typing:
```bash
git --version
```
If not installed, install via Homebrew:
```bash
brew install git
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install git
```

### Configure Git (Command Line Users)

After installing Git CLI, configure your identity:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify your configuration:
```bash
git config --list
```

---

## Creating Your First Repository

### Method 1: Using GitHub Website

1. **Create Repository on GitHub:**
   - Log into GitHub
   - Click the "+" icon in the top right
   - Select "New repository"
   - Enter repository name (e.g., "my-first-repo")
   - Add description (optional)
   - Choose Public or Private
   - Check "Add a README file"
   - Click "Create repository"

2. **Clone to Your Computer:**

   **Using GitHub Desktop:**
   - Open GitHub Desktop
   - Go to File > Clone Repository
   - Select your repository from the list
   - Choose local path and click "Clone"

   **Using Command Line:**
   ```bash
   git clone https://github.com/YOUR-USERNAME/my-first-repo.git
   cd my-first-repo
   ```

### Method 2: Start Locally, Then Push to GitHub

1. **Initialize Local Repository:**

   **Using GitHub Desktop:**
   - File > New Repository
   - Enter name and local path
   - Click "Create Repository"

   **Using Command Line:**
   ```bash
   mkdir my-project
   cd my-project
   git init
   ```

2. **Create Repository on GitHub:**
   - Go to GitHub and create a new repository (don't initialize with README)
   - Copy the repository URL

3. **Connect Local to Remote:**

   **Using GitHub Desktop:**
   - Repository > Repository Settings > Remote
   - Add the GitHub URL

   **Using Command Line:**
   ```bash
   git remote add origin https://github.com/YOUR-USERNAME/my-project.git
   git branch -M main
   git push -u origin main
   ```

---

## Basic Git Commands

### The Basic Workflow

The typical Git workflow follows these steps:

```
1. Make changes to files (Working Directory)
2. Stage changes (git add)
3. Commit changes (git commit)
4. Push to remote (git push)
```

### Essential Commands

#### 1. Check Status
See which files have been modified, staged, or are untracked:
```bash
git status
```

#### 2. Stage Changes
Add specific file:
```bash
git add filename.txt
```

Add all changes:
```bash
git add .
```

Add all files of a certain type:
```bash
git add *.py
```

#### 3. Commit Changes
Commit staged changes with a message:
```bash
git commit -m "Add initial project files"
```

Commit with a detailed message (opens text editor):
```bash
git commit
```

Stage and commit in one step (only for tracked files):
```bash
git commit -am "Update documentation"
```

#### 4. View History
See commit history:
```bash
git log
```

Condensed version:
```bash
git log --oneline
```

Show changes in each commit:
```bash
git log -p
```

#### 5. View Changes
See unstaged changes:
```bash
git diff
```

See staged changes:
```bash
git diff --staged
```

Compare with specific commit:
```bash
git diff commit-hash
```

#### 6. Undo Changes

Unstage a file (keep changes):
```bash
git reset filename.txt
```

Discard changes in working directory:
```bash
git checkout -- filename.txt
```

Undo last commit (keep changes):
```bash
git reset --soft HEAD~1
```

Undo last commit (discard changes):
```bash
git reset --hard HEAD~1
```

---

## Working with Remote Repositories

### Push Changes to GitHub

Push to the main branch:
```bash
git push origin main
```

If you've set upstream tracking:
```bash
git push
```

First time pushing a new branch:
```bash
git push -u origin branch-name
```

### Pull Changes from GitHub

Get latest changes:
```bash
git pull
```

Fetch changes without merging:
```bash
git fetch
git merge origin/main
```

### Working with Branches

Create a new branch:
```bash
git branch feature-name
```

Switch to a branch:
```bash
git checkout feature-name
```

Create and switch in one command:
```bash
git checkout -b feature-name
```

List all branches:
```bash
git branch
```

Delete a branch:
```bash
git branch -d feature-name
```

Merge a branch into current branch:
```bash
git merge feature-name
```

### Syncing Your Fork

If you forked a repository and want to sync with the original:

```bash
# Add upstream remote (one-time setup)
git remote add upstream https://github.com/ORIGINAL-OWNER/REPO.git

# Fetch upstream changes
git fetch upstream

# Merge upstream changes into your main branch
git checkout main
git merge upstream/main

# Push updates to your fork
git push origin main
```

---

## Best Practices

### Commit Messages

**Good commit messages:**
- Start with a verb in present tense ("Add", "Fix", "Update", "Remove")
- Be concise but descriptive
- Explain *why* not just *what*

Examples:
```
Good: "Add user authentication module"
Good: "Fix memory leak in data processing function"
Bad: "changes"
Bad: "stuff"
Bad: "asdfgh"
```

### Commit Frequency

- Commit often with small, logical changes
- Each commit should represent one logical unit of work
- Don't commit broken code to main branch

### .gitignore File

Create a `.gitignore` file to exclude:
- Temporary files (*.tmp, *.log)
- Build artifacts (dist/, build/)
- Dependencies (node_modules/, venv/)
- OS files (.DS_Store, Thumbs.db)
- Sensitive information (.env, config.local.js)

Example `.gitignore`:
```
# Python
__pycache__/
*.py[cod]
venv/
.env

# Node
node_modules/
npm-debug.log

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

### Branching Strategy

For coursework:
- `main` or `master`: stable, working code
- `dev` or `development`: integration branch
- `feature/feature-name`: individual features
- `bugfix/bug-name`: bug fixes

### Collaboration Tips

1. **Pull before you push**: Always pull latest changes before pushing
2. **Review before committing**: Use `git status` and `git diff`
3. **Write descriptive commit messages**
4. **Don't commit large binary files** (images, videos, datasets) unless necessary
5. **Use branches for experiments** and new features
6. **Communicate with your team** about major changes

### Security

- **Never commit passwords, API keys, or sensitive data**
- Use environment variables for secrets
- Check your commits before pushing
- Use `.gitignore` to exclude sensitive files

---

## Common Workflows

### Daily Workflow

```bash
# Start your day
git pull origin main

# Create a feature branch
git checkout -b feature/new-analysis

# Make changes, then check what changed
git status
git diff

# Stage and commit
git add analysis.py
git commit -m "Add statistical analysis module"

# Push your branch
git push -u origin feature/new-analysis

# Create Pull Request on GitHub for review
```

### Handling Merge Conflicts

When Git can't automatically merge:

1. Git will mark conflicts in files:
```
<<<<<<< HEAD
Your changes
=======
Their changes
>>>>>>> branch-name
```

2. Manually edit the file to resolve conflicts
3. Remove conflict markers
4. Stage the resolved file:
```bash
git add resolved-file.txt
```

5. Complete the merge:
```bash
git commit -m "Resolve merge conflict in resolved-file.txt"
```

---

## Quick Reference

### Setup
```bash
git config --global user.name "Name"
git config --global user.email "email@example.com"
git init
git clone <url>
```

### Basic Workflow
```bash
git status
git add <file>
git commit -m "message"
git push
git pull
```

### Branching
```bash
git branch <branch-name>
git checkout <branch-name>
git checkout -b <branch-name>
git merge <branch-name>
git branch -d <branch-name>
```

### Inspection
```bash
git log
git log --oneline
git diff
git status
```

### Remote
```bash
git remote add origin <url>
git remote -v
git push origin <branch>
git pull origin <branch>
```

---

## Additional Resources

- [GitHub Documentation](https://docs.github.com)
- [Pro Git Book (Free)](https://git-scm.com/book/en/v2)
- [GitHub Learning Lab](https://lab.github.com)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Visualizing Git](https://git-school.github.io/visualizing-git/)

---

## Getting Help

- Command help: `git help <command>` or `git <command> --help`
- GitHub Support: [support.github.com](https://support.github.com)
- Stack Overflow: Search or ask questions with the `git` tag

---

**Remember**: Git is a skill that improves with practice. Don't be afraid to experiment in a test repository!