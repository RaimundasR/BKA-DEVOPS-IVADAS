This workflow ensures:

- Push to feature/** → Triggers Docker build as development-stage (no deployment).
- Opening a PR to main → Deploys the same image from feature/** to staging (8081).
- Merging PR to main → Deploys the same image to production (8080).
- Always stops and removes the old container before starting a new one.
