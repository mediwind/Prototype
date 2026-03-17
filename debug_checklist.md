# Debugging Checklist

## 1. Safety Check 🛡️
- [x] **Project Integrity**: The recent errors were "linkage" errors (missing nodes/files), not "logic" errors in the core architecture. Now that nodes are restored, the foundation is stable again.
- [ ] **Combat Logic**: The "no damage" issue is likely a mismatch between the *Weapon's Hit Mask* and the *Enemy's Hurtbox Layer*.

## 2. Action Plan
- [ ] **Refactor Sword**: Convert `sword.tres` to use the new `WeaponData` system so it works with the `ActionController`.
- [ ] **Debug Damage**: Add print statements to `ActionController` to see what it is hitting (or not hitting).
- [ ] **Main Scene Testing**: Explain why starting in Main doesn't work (empty inventory) and provide a workaround.
