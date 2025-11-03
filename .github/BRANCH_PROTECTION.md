# Branch Protection Rules

This repository uses GitHub branch protection rules to ensure code quality.

## Protected Branches

### `main` branch

**Requirements:**
- ✅ Require status checks to pass before merging
- ✅ Require "Run Tests" check to pass
- ✅ Require branches to be up to date before merging
- ✅ Include administrators

## Status Checks

| Check | Description | Required |
|-------|-------------|----------|
| **Run Tests** | Runs all unit tests via CI | ✅ Yes |

## How to Contribute

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature
   ```

2. **Make changes and commit:**
   ```bash
   git add .
   git commit -m "feat: your feature description"
   ```

3. **Push to GitHub:**
   ```bash
   git push origin feature/your-feature
   ```

4. **Create Pull Request:**
   - Go to https://github.com/kitelev/ExocortexTaskTracker/pulls
   - Click "New Pull Request"
   - Select your branch
   - Wait for CI to pass ✅
   - Request review if needed

5. **Merge after CI passes:**
   - CI must show green ✅
   - All tests must pass
   - Branch must be up to date with main

## CI Pipeline

The CI pipeline runs on every push and PR:

```yaml
1. Checkout code
2. Show Swift version
3. Clean build
4. Build project
5. Run tests
6. Run test script
```

**If any step fails, the PR cannot be merged.**

## Local Testing

Before creating a PR, run tests locally:

```bash
./test.sh
```

This ensures your changes will pass CI.
