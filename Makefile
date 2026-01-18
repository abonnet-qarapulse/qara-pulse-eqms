# QMS Automation Makefile
#
# This Makefile is a template for QMS automation commands.
# Customize these targets based on the automation scripts you create in scripts/.
#
# Example structure:
#
# .PHONY: qms qms-check
#
# qms:
# 	@echo "🔍 Normalizing QMS metadata..."
# 	python3 scripts/your_normalize_script.py
# 	@echo "📚 Generating SMQ index..."
# 	python3 scripts/your_index_script.py
# 	@echo "✅ QMS synchronization completed."
#
# qms-check:
# 	@echo "🔍 Checking QMS consistency..."
# 	python3 scripts/your_normalize_script.py
# 	python3 scripts/your_index_script.py
# 	git diff --exit-code
#
# See scripts/README.md for guidance on creating automation scripts.
