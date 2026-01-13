import glob
from pathlib import Path
import duckdb

ROOT = Path(__file__).resolve().parent
con = duckdb.connect(database=":memory:")

con.execute("CREATE OR REPLACE VIEW users AS SELECT * FROM read_csv_auto('data/users.csv')")
con.execute("CREATE OR REPLACE VIEW events AS SELECT * FROM read_csv_auto('data/events.csv')")
con.execute("CREATE OR REPLACE VIEW transactions AS SELECT * FROM read_csv_auto('data/transactions.csv')")

print("Loaded tables:", con.execute("SHOW TABLES").fetchall())

query_files = sorted(glob.glob(str(ROOT / "queries" / "*.sql")))
for qf in query_files:
    name = Path(qf).name
    print("\n" + "="*80)
    print(name)
    print("="*80)
    sql = Path(qf).read_text()
    try:
        df = con.execute(sql).df()
        # Print a small preview
        print(df.head(15).to_string(index=False))
    except Exception as e:
        print(f"ERROR running {name}: {e}")
