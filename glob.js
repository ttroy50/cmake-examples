#!/usr/bin/env node
import { readFile } from "node:fs/promises";
import { spawn } from "node:child_process";

function ignoreToGlob(ignoreText) {
  return ignoreText
    .split(/\r?\n/g)
    .map((x) => x.trim())
    .filter((x) => x && !x.startsWith("#"))
    .map((x) => {
      if (x.startsWith("!")) {
        if (x.startsWith("!/")) {
          return x;
        } else {
          return `!**/${x.slice(1)}`;
        }
      } else {
        if (x.startsWith("/")) {
          return x;
        } else {
          return `**/${x}`;
        }
      }
    })
    .flatMap((x) => {
      if (x.endsWith("/")) {
        return `${x}**`;
      } else {
        return [x, `${x}/**`];
      }
    });
}

const index = process.argv.indexOf("--ignore-file");
if (index !== -1) {
  const [, ignorePath] = process.argv.splice(index, 2);
  const ignoreText = await readFile(ignorePath, "utf8");
  const ignoreGlobs = ignoreToGlob(ignoreText);
  const extraArgv = ignoreGlobs.flatMap((x) => ["-i", x]);
  process.argv.push(...extraArgv);
}

const child = spawn("npx", ["glob", ...process.argv.slice(2)], {
  stdio: "inherit",
});
child.on("exit", process.exit);
