import * as fs from 'fs';
import * as path from 'path';
import * as assert from 'assert';

interface GrammarPattern {
  name?: string;
  match?: string;
  begin?: string;
  end?: string;
  patterns?: GrammarPattern[];
  repository?: Record<string, GrammarPattern>;
  include?: string;
  captures?: Record<string, { name: string }>;
}

interface Grammar {
  name: string;
  scopeName: string;
  fileTypes: string[];
  patterns: GrammarPattern[];
  repository: Record<string, GrammarPattern>;
}

/**
 * Test suite for validating the Rego TextMate grammar
 */
suite('Grammar Validation Tests', () => {
  let grammar: Grammar;
  const grammarPath = path.resolve(__dirname, '../../../syntaxes/rego.tmLanguage.json');

  suiteSetup(() => {
    const content = fs.readFileSync(grammarPath, 'utf-8');
    grammar = JSON.parse(content) as Grammar;
  });

  test('Grammar file should be valid JSON', () => {
    assert.ok(grammar, 'Grammar should be loaded');
  });

  test('Grammar should have correct scopeName', () => {
    assert.strictEqual(grammar.scopeName, 'source.rego');
  });

  test('Grammar should have correct name', () => {
    assert.strictEqual(grammar.name, 'Rego');
  });

  test('Grammar should support .rego files', () => {
    assert.ok(grammar.fileTypes.includes('rego'));
  });

  test('Grammar should have patterns array', () => {
    assert.ok(Array.isArray(grammar.patterns));
    assert.ok(grammar.patterns.length > 0);
  });

  test('Grammar should have repository', () => {
    assert.ok(grammar.repository);
    assert.ok(typeof grammar.repository === 'object');
  });

  test('Grammar repository should have comments', () => {
    assert.ok(grammar.repository.comments);
    assert.ok(grammar.repository.comments.match);
  });

  test('Grammar repository should have strings', () => {
    assert.ok(grammar.repository.strings);
    assert.ok(grammar.repository.strings.name?.includes('string'));
  });

  test('Grammar repository should have keywords', () => {
    assert.ok(grammar.repository.keywords);
    assert.ok(grammar.repository.keywords.patterns);
  });

  test('Grammar repository should have operators', () => {
    assert.ok(grammar.repository.operators);
    assert.ok(grammar.repository.operators.patterns);
  });

  test('Grammar repository should have builtin-functions', () => {
    assert.ok(grammar.repository['builtin-functions']);
    assert.ok(grammar.repository['builtin-functions'].patterns);
  });

  test('Grammar repository should have numbers', () => {
    assert.ok(grammar.repository.numbers);
    assert.ok(grammar.repository.numbers.patterns);
  });

  test('Grammar repository should have constants', () => {
    assert.ok(grammar.repository.constants);
    assert.ok(grammar.repository.constants.patterns);
  });

  test('Grammar repository should have variables', () => {
    assert.ok(grammar.repository.variables);
    assert.ok(grammar.repository.variables.patterns);
  });

  test('All pattern includes should reference existing repository items', () => {
    const repositoryKeys = new Set(Object.keys(grammar.repository));
    
    function checkIncludes(patterns: GrammarPattern[]): void {
      for (const pattern of patterns) {
        if (pattern.include) {
          const ref = pattern.include.replace('#', '');
          assert.ok(
            repositoryKeys.has(ref),
            `Include reference "${pattern.include}" should exist in repository`
          );
        }
        if (pattern.patterns) {
          checkIncludes(pattern.patterns);
        }
      }
    }
    
    checkIncludes(grammar.patterns);
  });

  test('All regex patterns should be valid', () => {
    function checkRegex(patterns: GrammarPattern[], context: string): void {
      for (const pattern of patterns) {
        if (pattern.match) {
          try {
            new RegExp(pattern.match);
          } catch (e) {
            assert.fail(`Invalid regex in ${context}: ${pattern.match}`);
          }
        }
        if (pattern.begin) {
          try {
            new RegExp(pattern.begin);
          } catch (e) {
            assert.fail(`Invalid begin regex in ${context}: ${pattern.begin}`);
          }
        }
        if (pattern.end) {
          try {
            new RegExp(pattern.end);
          } catch (e) {
            assert.fail(`Invalid end regex in ${context}: ${pattern.end}`);
          }
        }
        if (pattern.patterns) {
          checkRegex(pattern.patterns, context);
        }
      }
    }

    checkRegex(grammar.patterns, 'main patterns');
    for (const [key, value] of Object.entries(grammar.repository)) {
      if (value.patterns) {
        checkRegex(value.patterns, `repository.${key}`);
      }
      if (value.match) {
        try {
          new RegExp(value.match);
        } catch (e) {
          assert.fail(`Invalid regex in repository.${key}: ${value.match}`);
        }
      }
    }
  });
});

/**
 * Test suite for keyword matching
 */
suite('Keyword Matching Tests', () => {
  let grammar: Grammar;
  const grammarPath = path.resolve(__dirname, '../../../syntaxes/rego.tmLanguage.json');

  suiteSetup(() => {
    const content = fs.readFileSync(grammarPath, 'utf-8');
    grammar = JSON.parse(content) as Grammar;
  });

  const controlKeywords = ['if', 'else', 'not', 'with', 'as', 'default', 'some', 'every', 'in', 'contains'];
  
  test('Control keywords should be matched', () => {
    const keywordPatterns = grammar.repository.keywords.patterns || [];
    const controlPattern = keywordPatterns.find(p => p.name === 'keyword.control.rego');
    assert.ok(controlPattern, 'Control keyword pattern should exist');
    assert.ok(controlPattern.match, 'Control keyword pattern should have match');
    
    const regex = new RegExp(controlPattern.match);
    for (const keyword of controlKeywords) {
      assert.ok(regex.test(keyword), `Keyword "${keyword}" should be matched`);
    }
  });

  const builtinCategories = [
    'aggregate',
    'string',
    'type',
    'numbers',
    'time',
    'crypto',
    'http',
    'net',
    'tracing',
  ];

  test('Built-in function categories should exist', () => {
    const builtinPatterns = grammar.repository['builtin-functions'].patterns || [];
    
    for (const category of builtinCategories) {
      const pattern = builtinPatterns.find(p => p.name?.includes(category));
      assert.ok(pattern, `Built-in category "${category}" should have a pattern`);
    }
  });
});

/**
 * Test suite for literal matching
 */
suite('Literal Matching Tests', () => {
  let grammar: Grammar;
  const grammarPath = path.resolve(__dirname, '../../../syntaxes/rego.tmLanguage.json');

  suiteSetup(() => {
    const content = fs.readFileSync(grammarPath, 'utf-8');
    grammar = JSON.parse(content) as Grammar;
  });

  test('Boolean literals should be matched', () => {
    const constantPatterns = grammar.repository.constants.patterns || [];
    const boolPattern = constantPatterns.find(p => p.name?.includes('boolean'));
    assert.ok(boolPattern, 'Boolean pattern should exist');
    
    const regex = new RegExp(boolPattern.match!);
    assert.ok(regex.test('true'), '"true" should be matched');
    assert.ok(regex.test('false'), '"false" should be matched');
  });

  test('Null literal should be matched', () => {
    const constantPatterns = grammar.repository.constants.patterns || [];
    const nullPattern = constantPatterns.find(p => p.name?.includes('null'));
    assert.ok(nullPattern, 'Null pattern should exist');
    
    const regex = new RegExp(nullPattern.match!);
    assert.ok(regex.test('null'), '"null" should be matched');
  });

  test('Integer numbers should be matched', () => {
    const numberPatterns = grammar.repository.numbers.patterns || [];
    const intPattern = numberPatterns.find(p => p.name?.includes('integer'));
    assert.ok(intPattern, 'Integer pattern should exist');
    
    const regex = new RegExp(intPattern.match!);
    assert.ok(regex.test('42'), '"42" should be matched');
    assert.ok(regex.test('0'), '"0" should be matched');
    assert.ok(regex.test('123456'), '"123456" should be matched');
  });

  test('Float numbers should be matched', () => {
    const numberPatterns = grammar.repository.numbers.patterns || [];
    const floatPattern = numberPatterns.find(p => p.name?.includes('float'));
    assert.ok(floatPattern, 'Float pattern should exist');
    
    const regex = new RegExp(floatPattern.match!);
    assert.ok(regex.test('3.14'), '"3.14" should be matched');
    assert.ok(regex.test('0.5'), '"0.5" should be matched');
    assert.ok(regex.test('1.5e10'), '"1.5e10" should be matched');
  });
});
