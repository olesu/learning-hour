import * as fs from 'fs';
import * as path from 'path';
import { main } from '../src/texttest-fixture';

describe('Golden Master', () => {
  it('output matches golden master for 30 days', () => {
    const logs: string[] = [];
    const originalLog = console.log;

    console.log = (...args: unknown[]) => {
      logs.push(args.map(String).join(' '));
    };

    try {
      main(30);
    } finally {
      console.log = originalLog;
    }

    const actualOutput = logs.join('\n') + '\n';

    const goldenMasterPath = path.join(
      __dirname,
      'golden-master-30-days.txt'
    );
    const expectedOutput = fs.readFileSync(goldenMasterPath, 'utf-8');

    expect(actualOutput).toBe(expectedOutput);
  });
});
