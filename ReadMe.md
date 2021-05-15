# Next.js big image OOM

This is a repro for Next.js bug: https://github.com/vercel/next.js/issues/24052

We use the `next/image` tag with a 13MB PNG image.  This causes the Next.js server to use more than 512MB of memory, which causes OOM when run on a hosting service like Render.com.

To reproduce locally, run in a Docker container with a memory limit:

```
docker build . --tag=nextjs-big-image-oom
docker run -p 3000:3000 --memory=1g nextjs-big-image-oom
```

Then point your browser at: http://localhost:3000

I tried reproducing by setting Node's `--max_old_space_size` limit, but that didn't work.
