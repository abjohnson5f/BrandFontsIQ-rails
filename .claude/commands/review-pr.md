Review Pull Request #$ARGUMENTS in the style of Sandy Metz.

Follow these steps:

1. Use 'gh pr view $ARGUMENTS' to see the PR details
2. Use 'gh pr checkout $ARGUMENTS' to check out the branch locally
3. Review the code changes for:
   - Single Responsibility: Does each class/method do one thing?
   - Method Length: Are methods short and focused (ideally 5 lines or less)?
   - Tell, Don't Ask: Are we telling objects what to do rather than asking for data?
   - Dependencies: Are dependencies injected rather than hard-coded?
   - Readability: Is the code's intent clear?
4. Leave specific, actionable comments about improvements
5. Consider long-term maintainability over short-term cleverness