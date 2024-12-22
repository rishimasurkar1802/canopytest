The repository contains a basic Github client for its REST API.

## Requirements
* Ruby 3.1
* Access to at least one Github repository
* Please create a personal access token for your personal account so that the Github API requests work. The repository is public, so any token will work.

## Instructions
It needs to be run at the command line like this

```
TOKEN=github_pat_xxx ruby process.rb <repository URL, like https://api.github.com/repos/user_or_organization/repo>
```

The code implements only one method in the API - `issues`. It outputs up to 50 issues in the provided repository. It lets you set whether the
issues returned are open or closed, and then displays them in decreasing order of date as follows:

1. If you selected open issues, the date used is the issue's created date.
1. Else, it's the issues' closed date.

## Missed Requirements Explanations
1. Method and class names : I tried to follow standard for method name and class name, needs more attention there.
2. Object oriented behaviors : I believe I was able to get OOP behaviours for pagination class, however that too requires more attention.
3. Proper use of a REST API’s standards : I was also able to pull off basic REST features.
4. (If you write tests) Following guidelines for writing tests that reduce the chance it’ll be flaky : Did not get time to attempt TEST CASES :(

## Below is the test result, with hard coded default values.

##### Command : 

```
$ TOKEN=<GITHUB-PAT> ruby process.rb https://api.github.com/repos/paper-trail-gem/paper_trail
```

#### Input 
page_no = 1, per_page = 3
#### Output
Total issues 30

Adjust CI Matrix Ruby Version to 3.0+ to align with gemspec - closed - Closed at: 2024-11-10T18:32:10Z
Test against rails 8.0 - closed - Closed at: 2024-10-23T23:12:56Z
Rails 8.0.0 compatibility - closed - Closed at: 2024-10-04T15:33:08Z


#### Input 
page_no = 2, per_page = 2
#### Output
Total issues 30

PaperTrail::Version.where_object` cannot not find serialized values in YAML object - closed - Closed at: 2024-05-15T01:46:39Z
yaml_column_permitted_classes warning never actually gets output - closed - Closed at: 2024-05-13T01:45:49Z


#### Input 
page_no = 2, per_page = 4
#### Output
Total issues 30

Suggest using numeric `whodunnit` column type for performance - closed - Closed at: 2024-09-08T00:23:54Z
Change `versions` table layout for performance - closed - Closed at: 2024-05-28T17:04:06Z
Incompatible with ActiveRecord 7's composite primary keys - closed - Closed at: 2024-05-24T01:45:07Z
Only track changes for updates; still track creation and destruction events - closed - Closed at: 2024-04-02T01:44:26Z

