# Runtime Environment Variables Example

## How it works

Instead of replacing environment variables during `docker build`, we can replace them during `docker run`. (see [./entrypoint.sh#L4](./entrypoint.sh#L4) for an example.)

## Running the example

```sh
git clone https://github.com/iendeavor/runtime-environment-variables-example.git

# Development
npm ci
npm run dev

# Production
npm run build
npm run preview
```
