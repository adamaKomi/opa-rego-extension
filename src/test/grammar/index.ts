import * as path from 'path';
import Mocha from 'mocha';
import { glob } from 'glob';

export async function run(): Promise<void> {
  const mocha = new Mocha({
    ui: 'tdd',
    color: true,
    timeout: 10000,
  });

  const testsRoot = __dirname;
  const files = await glob('*.test.js', { cwd: testsRoot });

  console.log(`Found ${files.length} test file(s) in ${testsRoot}`);
  
  files.forEach((f) => {
    const filePath = path.resolve(testsRoot, f);
    console.log(`  - ${f}`);
    mocha.addFile(filePath);
  });

  return new Promise((resolve, reject) => {
    mocha.run((failures: number) => {
      if (failures > 0) {
        reject(new Error(`${failures} grammar tests failed.`));
      } else {
        resolve();
      }
    });
  });
}
