async function main(): Promise<void> {
  try {
    // Dynamic import of the test module
    const { run } = await import('./index.js');
    await run();
    
    console.log('✓ All grammar tests passed!');
    process.exit(0);
  } catch (err) {
    console.error('✗ Grammar tests failed:', err);
    process.exit(1);
  }
}

void main();
