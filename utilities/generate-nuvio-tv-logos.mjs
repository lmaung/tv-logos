import { mkdir, readFile } from "node:fs/promises";
import { basename, dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { spawn } from "node:child_process";

const __dirname = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(__dirname, "..");
const sourceMapPath = resolve(process.argv[2] || join(repoRoot, "..", "usa-tv-streams", "data", "logo-sources.json"));
const outputDir = join(repoRoot, "nuvio", "tv");
const sourceMap = JSON.parse(await readFile(sourceMapPath, "utf8"));

await mkdir(outputDir, { recursive: true });

let generated = 0;
for (const [filename, sourcePath] of Object.entries(sourceMap)) {
  if (basename(sourcePath) !== filename) {
    throw new Error(`Logo filename collision or invalid source mapping: ${filename} -> ${sourcePath}`);
  }

  await run("magick", [
    join(repoRoot, sourcePath),
    "-trim",
    "+repage",
    "-resize",
    "360x360",
    "-gravity",
    "center",
    "-background",
    "none",
    "-extent",
    "512x512",
    join(outputDir, filename)
  ]);
  generated += 1;
}

console.log(`Generated ${generated} Nuvio-ready TV logos in ${outputDir}.`);

function run(command, args) {
  return new Promise((resolvePromise, reject) => {
    const child = spawn(command, args, { stdio: "inherit" });
    child.on("error", reject);
    child.on("exit", (code) => code === 0
      ? resolvePromise()
      : reject(new Error(`${command} exited with status ${code}`)));
  });
}
