Event	Expected Pipeline Behavior


- Push to feature/**	✅ Builds and pushes image to Docker Hub (my-vue-app:vX)
- Open PR to main	✅ Deploys the latest image to staging (vue-staging, port 8081)
- Merge PR into main	✅ Deploys the latest image to production (vue-nginx, port 8080)

> Vue.js app should deploy correctly to staging and production based on PRs and merges! 🚀