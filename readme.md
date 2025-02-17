This workflow ensures: ✅ Push to feature/** → Runs a single build as development stage (no deployment).

✅ Opening a PR to main → Uses the built image to deploy to staging (8081).
✅ Merging PR to main → Uses the same image to deploy to production (8080).
✅ Before starting a new container, the previous one is stopped and removed.